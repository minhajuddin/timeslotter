class App.Controllers.SlotsController extends Backbone.Controller
  routes:
    "":"index"
  initialize: (slots) ->
    @slots = new App.Collections.Slots()
    @slots.refresh(slots)
  index: ->
    @view = new App.Views.Slots.Index(slots: @slots)
    @view.render
