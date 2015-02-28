window.Krypton = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var users = new Krypton.Collections.Users(),
    view = new Krypton.Views.UsersIndex({collection: users});
    view.setElement($('#board'));

    setInterval(function(){ users.fetch({reset: true}); }, 3000);
  }
};

$(document).ready(function(){
  Krypton.initialize();
});
