$(function() {
  var $canvas = $("#drawing");
  if($canvas.length == 0) {
    return;
  }
  var $clear = $("#clear"),
      $form = $("#new_picture"),
      $hidden = $("#picture_image"),
      button_is_down = false,
      context = $canvas[0].getContext('2d');

  $(document).mouseup(function(e) {
    if(button_is_down) {
      var x = e.pageX - this.offsetLeft,
          y = e.pageY - this.offsetTop;
      context.lineTo(x,y);
      context.stroke();
    }
    button_is_down = false;
    $('body').removeClass('noselect');
  });

  $canvas.mousedown(function(e) {
    var x = e.pageX - this.offsetLeft,
        y = e.pageY - this.offsetTop;
    context.beginPath();
    context.moveTo(x,y);
    $('body').addClass('noselect');
    button_is_down = true;
  });

  $canvas.mousemove(function(e) {
    if(button_is_down) {
      var x = e.pageX - $canvas[0].offsetLeft,
          y = e.pageY - $canvas[0].offsetTop;
      context.lineTo(x,y);
      context.stroke();
    }
  });

  $form.on("submit", function(event) {
    event.preventDefault();

    var url = $canvas[0].toDataURL('image/png'),
        img = document.createElement('img'),
        drawings_target = $('#drawings_target');
    drawings_target.append(img); 
    img.src = url;
    $hidden.val(url);

    $.ajax({
       url: "/pictures/create/",
       type: "POST",
       data: {
         image: url
       },
       success: function( data ) {
         console.log("successfully created picture!");
         $form.hide();
         $canvas.hide();
         $("#new_drawings").append("<h4><small>Your picture is below! Please log out now.</small></h4><br /><img src='"+url +"' />");
       }
     });      
   });

  function clearCanvas() {
    context.clearRect(0,0,$canvas.width(),$canvas.height());   
  }

  $clear.click(clearCanvas);
  clearCanvas();


});

  // all of this was in an attempt to make drawing work in the mobile environment
  // none of it worked :(
  // leaving it here as notes so I know what I tried at least
    
  // start tracking the touches, move the pen to the beginning of a line
  // $canvas.bind('touchstart', function (event) {
  //   alert("in touchstart");
  //   var xy = extractXY(event.originalEvent.touches[0]);
  //   ctx.moveTo(xy.x, xy.y);
  //   event.preventDefault();
  //   return false;
  // });
  // draw a line from the last point to this one
  // $canvas.bind('touchmove', function (event) {
  //   alert("in touch move");
  //   var xy = extractXY(event.originalEvent.touches[0]);
  //   ctx.lineTo(xy.x, xy.y);
  //   ctx.stroke();
  //   event.preventDefault();
  //   return false;
  // });

  //$canvas.addEventListener( 'touchstart', onTouchStart, false );
  // $canvas.ontouchstart = function(e) {
  //   alert("in canvas touchstart listener");
  //   if (e.touches) e = e.touches[0];
  //   return false;
  // }

  // // Disable Page Move for mobile
  //   document.body.addEventListener('touchmove',function(event){
  //     event.preventDefault();
  //   },false);
 
  // // Events
  // document.body.addEventListener('touchstart', function(e) {
  //   alert("in touchstart: " + e);
  //   var x = e.targetTouches[0].pageX - this.offsetLeft,
  //       y = e.targetTouches[0].pageY - this.offsetTop;
  //   context.beginPath();
  //   context.moveTo(x,y);
  //   //$('body').addClass('noselect');
  //   button_is_down = true;
  // });

  // document.body.addEventListener('touchend', function(e) {
  //   alert("in touchend: " + e);
  //   if(button_is_down) {
  //   var x = e.pageX - this.offsetLeft,
  //       y = e.pageY - this.offsetTop;
  //     context.lineTo(x,y);
  //     context.stroke();
  //   }
  //   button_is_down = false;
  //   //$('body').removeClass('noselect');
  // });
  
  // document.body.addEventListener('touchmove', function(e) {
  //   alert("in touchmove: " + e);
  //   if(button_is_down) {
  //     var x = e.pageX - $canvas[0].offsetLeft,
  //         y = e.pageY - $canvas[0].offsetTop;
  //     context.lineTo(x,y);
  //     context.stroke();
  //   }
  // }); 

