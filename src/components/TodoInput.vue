<script setup lang="ts">
import { ref, onMounted, onUpdated } from 'vue'
const { text, addTodo } = defineProps<{ text: string; addTodo: () => void }>()
const emit = defineEmits(['text'])

const newText = ref(text)

const submit = () => {
  emit('text', newText.value)
  addTodo()
  newText.value = ''
}

onMounted(() => {
  console.log('TodoInput mounted')
})

onUpdated(() => {
  console.log('TodoInput updated')
})
</script>

<template>
  <input
    class="flex place-self-center p-1 my-3 rounded shadow-inner shadow-stone-500"
    type="text"
    :value="newText"
    @input="newText = $event.target.value"
    @keydown.enter="submit"
    :placeholder="'add new todo'"
  />
</template>

<style scoped></style>
