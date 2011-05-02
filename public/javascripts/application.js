window.App = {
  Controllers: {},
  Models: {},
  Views: {}
};

window.App.init = function() {

  App.Models.Slot = Backbone.Model.extend({
    defaults: {
      title: 'An awesome thing to do'
    },
    url: function() {
      if (!this.isNew()) {
        return '/slots/' + this.get('id');
      }
    }
  });

  App.Controllers.Slots = Backbone.Controller.extend({
    routes: {
      "help": "help"
    },
    help: function() {
      console.log("hello there");
    }
  });

  //kickoff the application
  new App.Controllers.Slots();
  (new App.Models.Slot({
    id: 1
  })).fetch();
  Backbone.history.start();
};

$(function() {
  App.init();
});

