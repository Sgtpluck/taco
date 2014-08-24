$(document).ready(function(){
  $('.swift').click(function (e) {
    e.preventDefault();
    var closest = $('.closest');
    closest.empty();
    sleep(2000);
    closest.append("<br>I'm sorry, there are no experienced Swift Developers near you.");

    function sleep(ms) {
      var dt = new Date();
      dt.setTime(dt.getTime() + ms);
      while (new Date().getTime() < dt.getTime());
      }
  });
});