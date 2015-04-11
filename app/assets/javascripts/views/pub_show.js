Large.Views.PubShow = Backbone.View.extend({
  template: JST['publications/pub_show'],

  events: {
    "click .follow": "toggleFollow"
  },

  initialize: function (options) {
    this.pub = options.pub;
    this.stories = this.pub.stories();
    this.publications = options.publications
    this.numFollows = this.pub.follows().length;
    this.listenTo(this.pub, 'sync', this.render);
    this.listenTo(this.stories, 'add', this.render);
    this.listenTo(this.publications, 'sync', this.render);
  },

  render: function () {
    var content = this.template({ pub: this.pub, followers: this.numFollows });
    this.$el.html(content);

    this.stories.models.forEach( function(story) {
      var storyPreview = new Large.Views.StoryPreview({ model: story, publications: this.publications });
      this.$('ul.pub-stories').prepend(storyPreview.render().$el);
    }.bind(this));

    return this;
  },

  toggleFollow: function () {
    console.log("method goes here");
  }
});