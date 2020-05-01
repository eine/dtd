<template>
  <div>
    <button v-on:click="beautify()">Beautify</button>
    <br>
    <textarea v-model="text" placeholder="JSON (WaveDrom)"></textarea>
    <br>
    <div :id="'a' +  id"></div>
  </div>
</template>

<script>
window.WaveSkin = require('wavedrom/skins/default.js');
var WaveDrom = require('wavedrom');

export default {
  name: 'WaveDrom',
  props: {
    id: Number,
    parentText: String
  },
  data () {
    return {
      text: this.parentText
    }
  },
  watch: {
    text: function() {
      this.draw();
    },/*
    parentText: function() {
      console.log(this.parentText);
    }*/
  },
  methods: {
    draw () {
      WaveDrom.renderWaveForm( this.id, JSON.parse(this.text), 'a' );
    },
    beautify () {
      this.text = JSON.stringify(JSON.parse(this.text), null, 2);
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="sass" scoped>
  /* write SASS! */
</style>
