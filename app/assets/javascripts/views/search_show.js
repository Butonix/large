Large.Views.SearchShow = Backbone.View.extend({
  template: JST['search/search_show'],

  render: function () {
    this.$el.html(this.template());
    return this;
  }
});