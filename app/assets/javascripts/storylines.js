$(function() {
 
    console.log("in storylines.js");

    //submitStoryline();
    //submitPlayer();

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
         success: function( data ) {
           console.log("successfully created a storyline");
         }
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
         success: function( data ) {
           console.log("successfully created players");
         },
         error: function( data ) {
          console.log("ooops");
         }
       });    
      });
    };

 });