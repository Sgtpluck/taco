$(document).ready(function(){
  $('.swift').click(function (e) {
    e.preventDefault();
    var closest = $('.closest');
    closest.append("<br>I'm sorry, there are no experienced swift developers near you.");

    });
});