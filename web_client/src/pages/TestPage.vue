<template>
  <template>
  <ul>
    <li v-for="(item, index) in items" :key="index">
      {{ index }}: {{ item }}
    </li>
  </ul>
</template>
</template>

<script>
export default {
  data() {
    return {
      items: ['Apple', 'Banana', 'Cherry']
    };
  }
  
};
</script>

<style scoped>
/* Add your styles here */
</style>