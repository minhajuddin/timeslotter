class App.Views.Slots.Index extends  Backbone.View
  initialize: (options) ->
    @slots = options.slots
    _.bindAll(this, "render")
    # slots.bind('change', 'render')
    @render()
  render: ->
    html = JST["index"]({ slots: @slots.toJSON() })
    $(this.el).html(html)
    this


class App.Views.Slots.New extends  Backbone.View
  initialize: (options) ->
    @slots = options.slots
    _.bindAll(this, "render")
    # slots.bind('change', 'render')
    @render()
  render: ->
    html = JST["new"]()
    $(this.el).html(html)
    this
