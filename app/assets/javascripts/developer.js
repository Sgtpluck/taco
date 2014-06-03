$(document).ready(function(){
  $('.swift').click(function (e) {
    e.preventDefault();
    var closest = $('.closest').delay(5000);
    closest.empty();
    closest.append("<br>I'm sorry, there are no experienced Swift Developers near you.");

    });
});