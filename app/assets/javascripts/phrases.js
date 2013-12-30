$(function() {
    console.log("in phrases.js");
    submitPhrase();

    function submitPhrase () {
      $form = $("#new_phrase");
      $form.on("submit", function(event) {
          event.preventDefault();
          var phrase = $("#phrase_text").val();
          var storyline_id = $("#storyline_id").val();
          var user_id = $("#user_id").val();
          console.log(storyline_id);
          console.log(phrase);
      $.ajax({
         url: "/phrases/create/",
         type: "POST",
         data: {
           text: phrase,
           storyline_id: storyline_id,
           user_id: user_id
         },
         success: function( data ) {
           console.log("successfully created a phrase");
           $("#new_phrase").hide();
           //$("#phrase_text").html("");
           $("#new_phrases").prepend("<h1>New Phrase</h1><br />"+phrase);
        
         }
       });    
      });
    };
 });