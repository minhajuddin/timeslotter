window.App =
  Controllers: {},
  Collections: {},
  Models: {},
  Views:
    Slots: {}
  init: (slots) ->
    window.controller = new App.Controllers.SlotsController(slots)
    Backbone.history.start()
