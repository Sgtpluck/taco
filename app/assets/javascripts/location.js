$(document).ready(function(){
  $('input.location').click(function (e) {
    e.preventDefault();
    var url = $('form.button_to').attr('action');
    var err = $('.error');
    var closest = $('.closest');
    {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(findPosition);
        }
      else {
        err.append("Geolocation is not supported by this browser.");
      }
    }
  function findPosition(position)
    {
    $.ajax({
        type: 'POST',
        url: url,
        data: {
            'latitude': position.coords.latitude,
            'longitude': position.coords.longitude,
            },
        success: function (data) {
          if (data == null) {
            closest.append('Sorry, we cannot find any nearby tacos. Best of luck to you in this time of need.')
          }
          else {
            closest.append("The closest tacos are at: " + data['name'] +
                                  "<br> They are located at " + data['vicinity'] +
                                  "<br> <a href='http://maps.google.com/?q&saddr=" +
                                    position.coords.latitude + "," +
                                    position.coords.longitude +
                                    "&daddr=" + data['vicinity'] + "&dirflg=w'> Walking directions </a>");
          }
        }
      });
    }

  function errorCallback(error) {
        alert('ERROR(' + error.code + '): ' + error.message);
    }
  });
});

// maps.google.com/?q=47.6229592&-122.3084003
// maps.google.com/?q&saddr=47.6229592,-122.3084003&daddr=216 26th ave s seattle wa 98144&dirflg=w

 