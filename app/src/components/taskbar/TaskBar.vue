<template>
  <div :class="'taskbar'+(tasks.length!=0?' withtabs':'')" style="display:flex">
    <button v-on:click="$emit( 'trigger', 'home' )" class="button is-radiusless is-small"><a class="mdi mdi-home"/></button>
    <button v-on:click="$emit( 'trigger', 'settings' )" class="button is-radiusless is-small"><a class="mdi mdi-settings"/></button>
    <DropDownSelect :nodes="layouts" :parentActive="activeLayout"/>
    <DropDownMenu v-on:trigger="menuTrigger" :node="workspaceMenu"/>
    <DropDownTasks v-on:trigger="taskTrigger" :tasks="tasks" :active="activeTask"/>
    <input id="file-input" v-show="false" type="file" v-on:change="uploadFile">
  </div>
</template>

<script>
import DropDownSelect from './DropDownSelect.vue'
import DropDownMenu from './DropDownMenu.vue'
import DropDownTasks from './DropDownTasks.vue'

var layouts = [
  { name: 'Windows',  icon: 'window-restore',  nodes:[] },
  { name: 'Tiles',    icon: 'view-dashboard',  nodes:[] },
  { name: 'Tabs',     icon: 'folder-multiple', nodes:[] },
  { name: 'Notebook', icon: 'view-stream',     nodes:[]}
];

var formats = [
  { name: 'FST',                 icon: '', nodes: [] },
  { name: 'GHW',                 icon: '', nodes: [] },
  { name: 'JSON (WaveDrom)',     icon: '', nodes: [] },
  { name: 'LaTeX (tikz-timing)', icon: '', nodes: [] },
  { name: 'LXT/LXT2',            icon: '', nodes: [] },
  { name: 'PNG',                 icon: '', nodes: [] },
  { name: 'SVG',                 icon: '', nodes: [] },
  { name: 'VCD/EVCD',            icon: '', nodes: [] },
  { name: 'VZT',                 icon: '', nodes: [] }
];

var workspaceMenu = {
  name: 'Add workspace', icon: 'plus-outline',         nodes: [
    { name: 'Empty', icon: 'square-outline',           nodes: [] },
    { name: 'Diagram',   icon: 'format-list-bulleted', nodes: [
      { name: 'New',  icon: 'playlist-plus', nodes: formats },
      { name: 'Load', icon: 'playlist-play', nodes: [] }
    ]},
    { name: 'Editor',          icon: 'pencil',         nodes: [] },
    { name: 'Xterm/log',       icon: 'console-line',   nodes: [] },
    { name: 'Graph/Schematic', icon: 'group',          nodes: [] },
    { name: 'Tree',            icon: 'file-tree',      nodes: [] }
  ]
};

export default {
  name: 'TaskBar',
  components: {
    DropDownSelect,
    DropDownMenu,
    DropDownTasks
  },
  props: {
    tasks: Array,
    activeTask: Number,
  },
  data () {
    return {
      layouts: layouts,
      workspaceMenu: workspaceMenu,
      activeLayout: layouts[0],
    }
  },
  methods: {
    menuTrigger (e) {
      if ( e === 'Add workspace,Diagram,Load' ) {
        document.getElementById("file-input").click();
      } else {
        this.$emit( 'trigger', 'trigger' , e )
      }
    },
    taskTrigger (e,v) {
      this.$emit( 'trigger', e , v )
    },
    uploadFile (e) {
      var file = e.target.files[0];
      if (!file) { return; }
      this.$emit( 'trigger', 'uploadFile' , file )
    },
    downloadFile (e) {
      console.log(e);
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="sass" scoped>
  /* write SASS! */
</style>

<style lang="sass">
  .taskbar
    padding: 2px
  .withtabs
    border-bottom: solid 1px #dbdbdb
  .dropdown-content
    padding-top: 0px
    padding-bottom: 0px
</style>
