var TelephonePictionary = TelephonePictionary || {}

TelephonePictionary.Picture = {
  successHandler: function( data ) {
    console.log(data);
    console.log("successfully created a picture");
    $("#new_picture").hide();
    $("#new_drawings").append("<h4><small>Your picture is below! Please log out now.</small></h4><br /><img src='"+$("#picture_image").val() +"' />");
  }
};

$(function() {

  var $canvas = $("#drawing"),
      $form = $("#new_picture"),
      $hidden = $("#picture_image"),
      $clear = $("#clear"),
      context = $canvas[0].getContext('2d');
 
  function clearCanvas() {
    context.clearRect(0,0,$canvas.width(),$canvas.height()); 
  }

  $('#clear').click(function() {
    clearCanvas();
    location.reload();
  });

  $.each(['#f00', '#ff0', '#0f0', '#0ff', '#00f', '#f0f', '#000', '#fff'], function() {
    $('#color_drawing .tools').append("<a href='#drawing' data-color='" + this + "' style='width: 10px; background: " + this + ";'>☆</a> ");
  });
  $.each([3, 5, 10], function() {
    $('#color_drawing .tools').append("<a href='#drawing' data-size='" + this + "' style='background: #ccc'>" + this + "</a> ");
  });
  $('#drawing').sketch();
 
  $form.on("submit", function(event) {
      event.preventDefault();
      submitPicture();
  });

  function submitPicture() {
    if($canvas.length == 0) {
      return;
    }
    var url = $canvas[0].toDataURL('image/png'),
        img = document.createElement('img'),
        drawings_target = $('#drawings_target');
    drawings_target.append(img); 
    img.src = url;
    $hidden.val(url);

    $.ajax({
       url: "/pictures",
       type: "POST",
       data: {
       image: url
       },
       error: function(data) {
          console.log("something went wrong");
       },
       success: TelephonePictionary.Picture.successHandler
       // success: function( data ) {
       //   console.log("successfully created picture!");
       //   $form.hide();
       //   $canvas.hide();
       //   $("#new_drawings").append("<h4><small>Your picture is below! Please log out now.</small></h4><br /><img src='"+url +"' />");
       // }
    });      
  }
});