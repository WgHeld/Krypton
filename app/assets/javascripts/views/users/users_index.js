Krypton.Views.UsersIndex = Backbone.View.extend({

  template: JST['users/show'],

  tagName: 'ul',

  initialize: function() {
    // this.collection.bind("add", _.bind(this.reRender, this));
    this.collection.bind("reset", _.bind(this.render, this));
    this.collection.fetch({reset: true});
  },

  render: function() {
    $(this.el).html("");
    for(var i=0; i < this.collection.length; i++) {
      $(this.el).append(this.template({
        user: this.collection.models[i]
      }));
    }
    return this;
  },

  reRender: function() {
    for(var i=0; i < this.collection.length; i++) {
      var user = this.collection.models[i];
      $(this.el).find("." + user.get('css')).css("order", i);
      // update points
    }
    return this;
  }

});
