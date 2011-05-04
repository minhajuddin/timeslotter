class App.Controllers.SlotsController extends Backbone.Controller
  routes:
    "":"index"
  index: ->
    slots = new App.Collections.Slots
    slots.fetch
      success: ->
        new App.Views.Slots.Index(collection:slots)
