<template>
  <div :class="'dropdown'+(show===true?' is-active':'')">
    <div v-on:click="show = !show" class="dropdown-trigger">
      <button class="button is-radiusless is-small" aria-haspopup="true" aria-controls="dropdown-menu" :disabled="tasks.length===0">
        <a class="mdi mdi-bookmark-outline"> Tasks</a>
      </button>
    </div>
    <div class="dropdown-menu is-radiusless" id="dropdown-menu" role="menu">
      <div class="dropdown-content is-radiusless">
        <a v-for="(task, index) in tasks" :key="index" v-on:click="$emit('trigger','active',index)" :class="(index===active?'is-active ':'')+'dropdown-item mdi mdi-square'"> {{ index }}. {{ task.title }}</a>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'DropDownTasks',
  props: {
    tasks: Array,
    active: Number,
  },
  data () {
    return {
      show: false
    }
  }
}
</script>

<style lang="sass" scoped>
  .dropdown-item
    padding-left: 8px
    padding-right: 8px
    line-height: 1.25
</style>
