TelephonePictionary.Routers.Storylines = Backbone.Router.extend({
  routes: {
        '': 'index'
    },

    index: function(){
        console.log("Index route has been called..");
    }
});
