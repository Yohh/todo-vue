<script setup lang="ts">
import Todo from "./Todo.vue";
import TodoInput from "./TodoInput.vue";
import fakeTodos from "../consts.ts";
import { ref, onMounted, onUpdated } from "vue";

const todos = ref(fakeTodos);

const newId = ref(todos.value[todos.value.length - 1].id + 1);
const newTodo = ref({ id: newId.value, text: "", done: false });

const addTodo = () => {
  newTodo.value.id = newId.value++;
  todos.value.push({ ...newTodo.value });
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
  console.log("Todolist mounted");
  console.log(todos.value);
});

onUpdated(() => {
  console.log("Todolist updated");
  console.log(todos.value);
});
</script>

<template>
  <h1>My Todolist</h1>
  <TodoInput
    :text="newTodo.text"
    :addTodo="addTodo"
    @text="newTodo.text = $event"
  />
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
