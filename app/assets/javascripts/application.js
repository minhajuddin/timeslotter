window.App = {
  Controllers: {},
  Collections: {},
  Models: {},
  Views: {
    Slots: {}
  }
};

window.App.init = function() {

  App.Models.Slot = Backbone.Model.extend({
    defaults: {
      title: 'An awesome thing to do'
    },
    url: function() {
      return this.isNew() ? '/slots/': '/slots/' + this.get('id');
    }
  });

  App.Collections.Slots = Backbone.Collection.extend({
    model: App.Models.Slot,
    url: '/slots'
  });

  App.Views.Slots.Index = Backbone.View.extend({
    el: $('#app'),
    events: {
      //'click #new': "newSlot"
    },
    initialize: function() {
      _.bindAll(this, "render");
      this.render();
    },
    render: function() {
      var template = "<% if(collection.models.length > 0) { %> <h3><a href='#new'>Create New</a></h3><ul> <% collection.each(function(slot) { %> <li><a href='#slot/<%= slot.id %>'><%= slot.escape('title') %></a></li> <% }); %> </ul> <% } else { %> <h3>No slots! <a href='#new'>Create one</a></h3> <% } %>";
      $(this.el).html(_.template(template, this));
      console.log('done rendering');
      return this;
    }
  });

  App.Views.Slots.NewView = Backbone.View.extend({
    events: {
      "submit form": "submitForm"
    },
    initialize: function() {
      _.bindAll(this, "render");
      this.render();
    },
    render: function() {
      var template = "<form><input class='title' type='text'/><input type='submit' value='Create Slot' /></form>";
      $(this.el).html(_.template(template, this.model));
      $("#app").append(this.el);
      return this;
    },
    submitForm: function() {
      this.model.set({
        'title': this.$('.title').val()
      });
      this.model.save();
      return false;
    }
  });

  App.Controllers.Slots = Backbone.Controller.extend({
    routes: {
      "": "index",
      "new": "newSlot",
      "slot/:id": "show"
    },
    initialize: function() {
      this.options = this.options.collection;
    },
    index: function() {
      var slots = new App.Collections.Slots;
      slots.fetch({
        success: function() {
          new App.Views.Slots.Index({
            collection: slots
          });
        }
      });
    },
    newSlot: function() {
      console.log('new slot');
      var slot = new App.Models.Slot;
      new App.Views.Slots.NewView({
        model: slot
      });
    },
    show: function(id) {
      debugger;
      console.dir(this.options.collection.get(id));
    }
  });

  //kickoff the application
  new App.Controllers.Slots();
  Backbone.history.start();
};

$(function() {
  App.init();
});

