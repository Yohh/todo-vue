<script setup lang="ts">
import { defineProps } from "vue";
const { text, done, removeTodo, setToDone } = defineProps<{
  id: number;
  text: string;
  done: boolean;
  removeTodo: (id: number) => void;
  setToDone: (done: boolean, id: number) => void;
}>();
</script>

<template>
  <li>
    <input type="checkbox" :checked="done" @change="setToDone(done, id)" />
    <span :class="{ 'line-through': done }">
      {{ text }}
    </span>
    <button @click="removeTodo(id)">X</button>
  </li>
</template>

<style scoped></style>
