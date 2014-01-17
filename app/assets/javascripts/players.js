$(function() {
    //console.log("in player.js");
    submitPlayer();

    function submitPlayer () {
      $form = $("#new_player");
      console.log("in player form: " + $form.length);
      $form.on("submit", function(event) {
          event.preventDefault();
          var name = $("#player_name").val();
          var phone = $("#player_phone_number").val();
          var turn = $("#player_turn_number").val();
      $.ajax({
         url: "/players",
         type: "POST",
         data: {
           name: name,
           phone_number: phone,
           turn_number: turn
         },
         success: function( data ) {
           console.log("success");
           $form.hide();       
         },
         error: function( data ) {
          console.log("ooops");
         }
       });    
      });
    };
 });