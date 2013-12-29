$(function() {
    // $canvas = $("#new_picture");
    // $canvas.hide();
    console.log("in storylines.js");
    
    submitPhrase();

    function submitPhrase () {
      $form = $("#new_storyline");
      console.log("here's form: " + $form.length);
      $form.on("submit", function(event) {
          event.preventDefault();
          var phrase = $("#phrase_text").val();
          //console.log(phrase);
      $.ajax({
         url: "/phrases/create/",
         type: "POST",
         data: {
           text: phrase
         },
         success: function( data ) {
           console.log("success");
           //$("#new_phrase").hide();
           //$("#phrase_text").html("");
           $("#new_phrases").prepend("<h1>New Phrase</h1><br /> <li>"+phrase+"</li>");
        
         }
       });    
      });
    };
 });