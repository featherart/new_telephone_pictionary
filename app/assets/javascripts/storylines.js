var TelephonePictionary = TelephonePictionary || {}

TelephonePictionary.Storyline = {
  successHandler: function( data ) {
    console.log(data);
    console.log("successfully created a storyline");
    $("#new_storyline").hide();
    //$("#new_drawings").append("<h4><small>Your picture is below! Please log out now.</small></h4><br /><img src='"+$("#picture_image").val() +"' />");
  }
};

$(function() {
    submitStoryline();
    submitPlayer();

    function submitStoryline () {
      $form = $("#new_storyline");
      console.log("here's storyline form: " + $form.length);
      $form.on("submit", function(event) {
          event.preventDefault();
      $.ajax({
         url: "/storylines/create/",
         type: "POST",
         data: {
           active: true
         },
        success: TelephonePictionary.Storyline.successHandler
       });    
      });
    };

    function submitPlayer () {
      $form = $("#new_storyline");
      $form.on("submit", function(event) {
          event.preventDefault();
          var name = $("#player_name").val();
          var phone = $("#player_phone_number").val();
          var turn = $("#player_turn_number").val();
      $.ajax({
         url: "/players/create",
         type: "POST",
         data: {
           name: name,
           phone_number: phone,
           turn_number: turn
         },
         success: TelephonePictionary.Storyline.successHandler,
         error: function( data ) {
          console.log("error submitting player");
         }
       });    
      });
    };

 });