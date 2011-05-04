class App.Controllers.SlotsController extends Backbone.Controller
  routes:
    "":"index"
  index: ->
    slots = new App.Collections.Slots
    slots.fetch
