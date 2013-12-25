$(function() {
// this is a WIP - seeing if phrases will work first
    
    //console.log("here's form: " + $form.length);
    //submitPlayer();

    function submitPlayer () {
      $form = $("#new_player");
      $form.on("submit", function(event) {
          event.preventDefault();
          var name = $("#player_name").val();
          var phone = $("#player_phone_number").val();
          var turn = $("#player_turn_number").val();
      $.ajax({
         url: "/",
         type: "POST",
         data: {
           name: name,
           phone_number: phone,
           turn_number: turn
         },
         success: function( data ) {
           console.log("success");

           $form.hide();
           //$("#new_phrases").prepend("<li>"+phrase+"</li>");
        
         },
         error: function( data ) {
          console.log("ooops");
         }
       });    
      });
    };
 });