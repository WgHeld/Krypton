window.Krypton = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var users = new Krypton.Collections.Users(),
    userView  = new Krypton.Views.UsersIndex({collection: users}),
    tasks     = new Krypton.Collections.Tasks(),
    taskView  = new Krypton.Views.TasksIndex({collection: tasks});

    taskView.setElement($('#tasks'));
    userView.setElement($('#board'));

    if (window.location.href.indexOf("reload") > -1) {
      console.log("Auto-Reload enabled");
      setInterval(function(){ tasks.fetch({reset: true}); }, 500);
      setInterval(function(){ users.fetch({reset: true}); }, 3000);
    }
  }
};

$(document).ready(function(){
  Krypton.initialize();
});
