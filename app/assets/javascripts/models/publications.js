Large.Models.Publication = Backbone.Model.extend({
  urlRoot: 'api/publications',

  stories: function () {
    if (this._stories === undefined) {
      this._stories = new Large.Collections.Stories({
        pub_id: this.id, publication: this
      });
    }
    return this._stories;
  },

  parse: function (payload) {
    if (payload.stories) {
      this.stories().set(payload.stories, { parse: true });
      delete payload.stories
    }
    return payload;
  }

});
