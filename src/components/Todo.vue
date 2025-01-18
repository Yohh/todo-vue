<script setup lang="ts">
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
    <button
      class="bg-gray-400 p-1 mx-1 w-6 h-6 flex justify-center align-middle"
      @click="removeTodo(id)"
    >
      <span>&times;</span>
    </button>
  </li>
</template>

<style scoped></style>
