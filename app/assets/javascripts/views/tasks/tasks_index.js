Krypton.Views.TasksIndex = Backbone.View.extend({

  template: JST['tasks/show'],

  initialize: function() {
    this.collection.bind("reset", _.bind(this.render, this));
    this.collection.fetch({reset: true});
  },

  render: function() {
    $(this.el).html("");
    for(var i=0; i < this.collection.length; i++) {
      $(this.el).append(this.template({
        task: this.collection.models[i]
      }));
    }
    return this;
  },
});
