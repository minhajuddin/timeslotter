window.App =
  Controllers: {},
  Collections: {},
  Models: {},
  Views:
    Slots: {}
  init: ->
    new App.Controllers.SlotsController
    Backbone.history.start()
