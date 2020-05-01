<template>
  <div class="tabs is-small is-boxed is-fullwidth">
    <ul :class="(tasks.length!=0?'':'notabs')">
      <!--<li class="is-active"><a>Home</a></li>-->
      <li v-for="(task, index) in tasks" :key="index" v-on:click="$emit( 'tab' , index )" :class="(index===active?'is-active':'')"><a>{{ index }}. {{ task.title }}</a></li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'Tabs',
  props: {
    tasks: Array,
    active: Number
  }
}
</script>

<style lang="sass" scoped>
  @import ../../sass/colors.sass
  .tabs
    margin-bottom: 0px
  .notabs
    border-bottom-style: none
  .tabs li.is-active a
    color: $dtd-front
</style>
