class App.Views.Slots.Index extends  Backbone.View
  el: $('#app')
  initialize: ->
    _.bindAll(this, "render")
    render()
  render: ->
    template = "<% if(collection.models.length > 0) { %> <h3><a href='#new'>Create New</a></h3><ul> <% collection.each(function(slot) { %> <li><a href='#slot/<%= slot.id %>'><%= slot.escape('title') %></a></li> <% }); %> </ul> <% } else { %> <h3>No slots! <a href='#new'>Create one</a></h3> <% } %>"
    $(this.el).html(_.template(template, this))
    console.log('done rendering')
    return this