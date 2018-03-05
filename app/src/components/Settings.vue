<template>
  <div>
  <div :class="'modal'+(show===true?' is-active':'')">
    <div class="modal-background"></div>
      <div class="modal-card">
        <header class="modal-card-head">
          <p class="modal-card-title">Settings</p>
          <button v-on:click="close()" class="delete" aria-label="close"></button>
        </header>
        <section class="modal-card-body">
        <!-- Content ... -->
        <div class="field">
          <div class="control">
            <label class="label">Tabs</label>
          </div>
        </div>
        <div class="field is-grouped">
          <div class="control">
            <label class="label is-small">Alignment</label>
          </div>
          <div class="control">
            <div class="select is-small">
              <select>
                <option>Default</option>
                <option>Centered</option><!--is-centered-->
                <option>Right</option><!--is-right-->
              </select>
            </div>
          </div>
          <div class="control">
            <label class="checkbox">
              <input type="checkbox">
              Full width<!--is-fullwidth-->
            </label>
          </div>
        </div>
        <div class="field is-grouped">
          <div class="control">
            <label class="label is-small">Size</label>
          </div>
          <div class="control">
            <div class="select is-small">
              <select>
                <option>Default</option>
                <option>Small</option><!--is-small-->
                <option>Medium</option><!--is-medium-->
                <option>Large</option><!--is-large-->
              </select>
            </div>
          </div>
        </div>
        <div class="field is-grouped">
          <div class="control">
            <label class="label is-small">Border</label>
          </div>
          <div class="control">
            <div class="select is-small">
              <select>
                <option>Default</option>
                <option>Boxed</option><!--is-boxed-->
                <option>Toggle</option><!--is-toggle-->
                <option>Rounded toggle</option><!--is-toggle-rounded-->
              </select>
            </div>
          </div>
        </div>
        <hr>
        </section>
        <footer class="modal-card-foot">
          <button v-on:click="close()" class="button is-success">Save changes</button>
          <button v-on:click="close()" class="button">Cancel</button>
        </footer>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Settings',
  props: {
    show: Boolean,
  },
  methods: {
    close () {
      this.$emit('show',false);
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="sass" scoped>
  /* write SASS! */
</style>
