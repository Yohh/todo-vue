<script setup lang="ts">
import { Eye, EyeClosed } from 'lucide-vue-next'
import Todo from './Todo.vue'
import TodoInput from './TodoInput.vue'
import fakeTodos from '../consts.ts'
import { ref, computed, onMounted, onUpdated } from 'vue'

const todos = ref(fakeTodos)
const showDone = ref(true)

const filteredTodos = computed(() => {
  return showDone.value ? todos.value : todos.value.filter((todo) => !todo.done)
})

const newId = ref(todos.value[todos.value.length - 1].id + 1)
const newTodo = ref({ id: newId.value, text: '', done: false })

const addTodo = () => {
  newTodo.value.id = newId.value++
  todos.value.push({ ...newTodo.value })
}

const setToDone = (done: boolean, id: number) => {
  todos.value = todos.value.map((todo) =>
    todo.id === id ? { ...todo, done: !done } : todo
  )
}

const removeTodo = (id: number) => {
  todos.value = todos.value.filter((todo) => todo.id !== id)
}

onMounted(() => {
  console.log('Todolist mounted')
  console.log(todos.value)
})

onUpdated(() => {
  console.log('Todolist updated')
  console.log(todos.value)
})
</script>

<template>
  <div class="relative bg-orange-400 h-1/2 w-1/3 rounded">
    <div class="bg-orange-300 h-10 flex justify-center items-center rounded-t">
      <h1 class="place-self-center font-bold">TODOLIST</h1>
    </div>
    <TodoInput
      :text="newTodo.text"
      :addTodo="addTodo"
      @text="newTodo.text = $event"
    />
    <ul class="place-self-center h-3/4 w-2/3 overflow-y-auto">
      <Todo
        v-for="{ id, text, done } in filteredTodos"
        :key="id"
        :id
        :text
        :done
        :removeTodo
        :setToDone
      />
    </ul>
    <button
      class="absolute bg-orange-300 hover:bg-orange-200 shadow shadow-stone-700 p-1 flex justify-center items-center rounded top-12 right-2"
      @click="showDone = !showDone"
    >
      <component
        :is="showDone ? Eye : EyeClosed"
        color="#57534e"
        :stroke-width="2"
      />
    </button>
  </div>
</template>

<style scoped></style>
