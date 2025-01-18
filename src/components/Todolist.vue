<script setup lang="ts">
import Todo from "./Todo.vue";
import { ref, onMounted, onUpdated } from "vue";

const todos = ref([
  { id: 1, text: "Learn Vue 3", done: false },
  { id: 2, text: "Learn React", done: false },
  { id: 3, text: "Build something awesome", done: false },
]);

const newId = ref(todos.value[todos.value.length - 1].id + 1);
const newTodo = ref({ id: newId.value, text: "", done: false });

const addTodo = () => {
  newTodo.value.id = newId.value++;
  todos.value.push({ ...newTodo.value });
  newTodo.value.text = "";
};

const setToDone = (done: boolean, id: number) => {
  todos.value = todos.value.map((todo) =>
    todo.id === id ? { ...todo, done: !done } : todo,
  );
};

const removeTodo = (id: number) => {
  todos.value = todos.value.filter((todo) => todo.id !== id);
};

onMounted(() => {
  console.log("Component mounted");
  console.log(todos.value);
});

onUpdated(() => {
  console.log("Component updated");
  console.log(todos.value);
});
</script>

<template>
  <h1>My Todolist</h1>
  <input type="text" v-model="newTodo.text" @keyup.enter="addTodo" />
  <ul>
    <Todo
      v-for="{ id, text, done } in todos"
      :key="id"
      :id
      :text
      :done
      :removeTodo
      :setToDone
    />
  </ul>
</template>

<style scoped></style>
