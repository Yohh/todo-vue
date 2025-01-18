<script setup lang="ts">
import { ref, onMounted, onUpdated } from "vue";
const { text, addTodo } = defineProps<{ text: string; addTodo: () => void }>();
const emit = defineEmits(["text"]);

const newText = ref(text);

const submit = () => {
  emit("text", newText.value);
  addTodo();
  newText.value = "";
};

onMounted(() => {
  console.log("TodoInput mounted");
});

onUpdated(() => {
  console.log("TodoInput updated");
});
</script>

<template>
  <input
    type="text"
    :value="newText"
    @input="newText = $event.target.value"
    @keydown.enter="submit"
  />
</template>

<style scoped></style>
