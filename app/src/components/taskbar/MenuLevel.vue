<template>
  <ul class="menu-list">
    <li v-for="(inode, index) in node.nodes" :key="index">
      <a v-on:click="trigger(filterParents+node.name, inode.name)" :class="'mdi mdi-'+inode.icon"> {{ inode.name }}<i v-if="inode.nodes.length != 0" :class="'is-pulled-right mdi mdi-chevron-'+(show[inode.name]?'up':'down')"/></a>
      <MenuLevel v-show="show[inode.name]" v-on:trigger="trigger" v-if="inode.nodes.length != 0" :parents="filterParents+node.name" :node="inode"/>
    </li>
  </ul>
</template>

<script>
export default {
  name: 'MenuLevel',
  props: {
    node: Object,
    parents: String
  },
  data () {
    return {
      show: this.init()
    }
  },
  computed: {
    filterParents: function () {
      var p = this.parents;
      return ( (p.length != 0) ? (p + ',') : '' );
    }
  },
  methods: {
    trigger (n,i) {
      if (i!=undefined) {
        this.show[i] = !this.show[i];
        this.$emit( 'trigger', n+','+i )
      } else {
        this.$emit( 'trigger', n )
      }
    },
    init () {
      var n = this.node.nodes;
      var a = {};
      for ( var x=0 ; x<n.length ; x++ ) {
        if (n[x].nodes.length!=0) {
          a[n[x].name] = false;
        }
      }
      return a;
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="sass" scoped>
  .menu-list a
    font-size: 0.875rem
    padding: 0.375rem 8px
    padding-right: 0px
    margin-right: 0px
  .menu-list li ul
    margin: 0
    margin-left: 8px
    padding-left: 0px
    padding-right: 0px
  .mdi-chevron-up
    margin-right: 8px
  .mdi-chevron-down
    margin-right: 8px
</style>
