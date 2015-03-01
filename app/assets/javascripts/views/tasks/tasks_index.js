Krypton.Views.TasksIndex = Backbone.View.extend({

  template: JST['tasks/show'],

  events: {
    "click .claimable": "claim",
  },

  claim: function(event) {
    var elem = $(event.currentTarget),
    taskId = elem.data("task-id"),
    user = this.getUrlParameter('user');

    if (user) {
      $.ajax({
        type: "POST",
        url:  '/client/tasks/' + taskId + '/claim',
        data: { user: user },
        dataType: 'json'
      }).fail(function() {
        elem.fadeIn();
      });
      elem.fadeOut();
    }
  },

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

  getUrlParameter: function(sParam) {
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++)
    {
      var sParameterName = sURLVariables[i].split('=');
      if (sParameterName[0] == sParam)
      {
          return sParameterName[1];
      }
    }
  }

});
