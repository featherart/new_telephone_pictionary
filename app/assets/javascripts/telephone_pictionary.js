window.TelephonePictionary = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    init: ->
    new TelephonePictionary.Routers.Entries()
    Backbone.history.start()
  }
};

$(document).ready(function(){
  TelephonePictionary.initialize();
});
