class App.Models.Slot extends  Backbone.Model
  defaults:
    title: 'An awesome thing to do'
  url: ->
    return this.isNew() ? '/slots/': '/slots/' + this.get('id')

class App.Collections.Slots extends Backbone.Collection
  model: App.Models.Slot
  url: '/slots'
