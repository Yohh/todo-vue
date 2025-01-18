<script setup lang="ts">
import { X } from "lucide-vue-next";
const { text, done, removeTodo, setToDone } = defineProps<{
  id: number;
  text: string;
  done: boolean;
  removeTodo: (id: number) => void;
  setToDone: (done: boolean, id: number) => void;
}>();
</script>

<template>
  <li class="flex items-center h-8 my-2">
    <input
      type="checkbox"
      :checked="done"
      class="mx-1"
      @change="setToDone(done, id)"
    />
    <span class="inline-block align-bottom" :class="{ 'line-through': done }">
      {{ text }}
    </span>
    <button
      class="bg-gray-400 p-1 mx-1 flex justify-center items-center rounded"
      @click="removeTodo(id)"
    >
      <X />
    </button>
  </li>
</template>

<style scoped></style>
