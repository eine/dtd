<template>
  <div>
    <p v-if="obj.type==='empty'">Empty workspace</p>
    <button v-on:click="$emit( 'close' , id )" class="delete"/>
    <WaveDrom v-if="obj.type==='wavedrom'" :id="id" :parentText="obj.data.text"/>
    <Editor v-if="obj.type==='editor'"/>
  </div>
</template>

<script>
import WaveDrom from './WaveDrom.vue'
import Editor from './Editor.vue'

export default {
  name: 'Workspace',
  components: {
    WaveDrom,
    Editor
  },
  props: {
    id: Number,
    obj: Object,
  }/*,
  methods: {
    close () {
      this.$emit( 'close' , this.id )
    }
  }*/
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="sass" scoped>
</style>
