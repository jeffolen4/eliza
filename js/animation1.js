$(document).ready( function () {

  var shipj = $('#spaceship');
  var space = $('#space');
  var ship = document.getElementById("spaceship");
  var timerId;
  var spacePad = 4;

  function shrink() {
    if ( shipj.height() < 30) {
      shipj.hide();
      clearInterval(timerId);
    } else {
      shipj.animate({
        height: '-=' + shipj.height() / 2,
        width: '-=' + shipj.width() / 2
      });
      space.css("padding", ( (space.width - shipj.width) - (shipj.width) + "px") );
    }
  }

  shipj.click( function() {
    //shrink();
    timerId = setInterval(shrink, 3000);
  });

})
