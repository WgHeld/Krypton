Krypton.Views.UsersIndex = Backbone.View.extend({

  template: JST['users/show'],

  initialize: function() {
    this.collection.bind("reset", _.bind(this.render, this));
    this.collection.fetch({reset: true});
  },

  render: function() {
    $(this.el).html("");
    for(var i=0; i < this.collection.length; i++) {
      $(this.el).append(this.template({
        pos: (i + 1),
        user: this.collection.models[i]
      }));
    }
    return this;
  },
});
