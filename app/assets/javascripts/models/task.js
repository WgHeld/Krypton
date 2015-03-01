Krypton.Models.Task = Backbone.Model.extend({

  claimable: function() {
    if (!this.get('claimed?')) {
      return ' claimable';
    }
  }
});
