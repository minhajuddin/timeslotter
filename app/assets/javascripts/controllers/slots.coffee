class App.Controllers.SlotsController extends Backbone.Controller
  routes:
    "":"index"
    "/new":"addNew"
  initialize: (slots) ->
    @slots = new App.Collections.Slots()
    @slots.refresh(slots)
  index: ->
    @view = new App.Views.Slots.Index(slots: @slots)
    @view.render
    $("#slots").html(@view.el)
  addNew: ->
    @view = new App.Views.Slots.New(model: new App.Models.Slot())
    @view.render
    $("#slots").html(@view.el)
