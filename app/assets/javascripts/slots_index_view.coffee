class App.Views.Slots.Index extends  Backbone.View
  initialize: (options) ->
    @slots = options.slots
    _.bindAll(this, "render")
    @render()
  render: ->
    html = JST["index"]({ slots: @slots.toJSON() })
    $(this.el).html(html)
    $("#slots").html(@el)
    this
