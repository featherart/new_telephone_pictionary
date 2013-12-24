$(function() {
// this is a WIP - seeing if phrases will work first
    
    //console.log("here's form: " + $form.length);
    submitPlayer();

    function submitPlayer () {
      $form = $("#new_player");
      $form.on("submit", function(event) {
          event.preventDefault();
          var phrase = $("#phrase_text").val();
          console.log(phrase);
      $.ajax({
         url: "/",
         type: "POST",
         data: {
           text: phrase
         },
         success: function( data ) {
           console.log("success");
           //$form.hide();
           $("#new_phrases").prepend("<li>"+phrase+"</li>");
        
         }
       });    
      });
    };
 });