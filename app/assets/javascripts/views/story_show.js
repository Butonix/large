Large.Views.StoryShow = Backbone.View.extend({
  template: JST['stories/story_show'],

  initialize: function (options) {
    this.story = options.story;
    this.listenTo(this.story, 'sync', this.render);
  },

  render: function () {
    var content = this.template({ story: this.story });
    this.$el.html(content);

    Large.Collections.publications.fetch({
      data: { current_user: true }
    });
    var newStory = new Large.Models.Story();
    var newStoryView = new Large.Views.NewStory({ collection: this.stories, model: newStory, publications: Large.Collections.publications });

    this.$el.append(newStoryView.render().$el);

    return this;
  },

});