<script setup lang="ts">
import { Check, Undo, X } from 'lucide-vue-next'
import { ref, onMounted, onUpdated } from 'vue'
const { text, done, removeTodo, setToDone } = defineProps<{
  id: number
  text: string
  done: boolean
  removeTodo: (id: number) => void
  setToDone: (done: boolean, id: number) => void
}>()

onMounted(() => {
  console.log('Todo mounted')
})

onUpdated(() => {
  console.log('Todo updated')
})
</script>

<template>
  <li
    :class="!done ? 'bg-orange-300' : 'bg-orange-100'"
    class="bg-orange-300 flex items-center h-12 w-full px-3 my-2 rounded-full border-y-green-800 border-y-2"
  >
    <span
      class="grow inline-block align-bottom text-ellipsis overflow-hidden text-nowrap"
      :class="{ 'line-through': done, 'text-gray-500': done }"
      :title="text"
    >
      {{ text }}
    </span>
    <button
      :class="
        !done
          ? 'bg-green-500 hover:bg-green-400'
          : 'bg-teal-500 hover:bg-teal-400'
      "
      class="shadow shadow-stone-700 p-1 mx-1 flex justify-center items-center rounded"
      @click="setToDone(done, id)"
    >
      <component :is="!done ? Check : Undo" color="white" :stroke-width="3" />
    </button>
    <button
      class="bg-red-500 hover:bg-red-400 shadow shadow-stone-700 p-1 mx-1 flex justify-center items-center rounded"
      @click="removeTodo(id)"
    >
      <X color="white" :stroke-width="3" />
    </button>
  </li>
</template>

<style scoped></style>
