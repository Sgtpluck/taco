$(document).ready(function(){
  $('input.location').click(function (e) {
    e.preventDefault();
    var url = document.querySelector('form.button_to').action;
    var lon = document.querySelector('.long');
    var lat = document.querySelector('.lat');
    var err = document.querySelector('.error');
    var closest = document.querySelector('.closest');
    {
    if (navigator.geolocation)
      {
      navigator.geolocation.getCurrentPosition(findPosition);
      }
    else{err.innerHTML = "Geolocation is not supported by this browser.";}
    }
  function findPosition(position) 
    {
    lat.innerHTML = "Latitude: " + position.coords.latitude;
    lon.innerHTML = 'Longitude:' + position.coords.longitude;
    $.ajax({
        type: 'POST',
        url: url,
        data: {
            'latitude': position.coords.latitude,
            'longitude': position.coords.longitude,
            },
        success: function (data) {
          console.log(data);
          restaurant_location = data.location.display_address;
          closest.innerHTML = ("The closest tacos are at: " + data.name +
                                "<br> They are located at " + restaurant_location.join(' ') +
                                "<br> <a href='http://maps.google.com/?q&saddr=" +
                                  position.coords.latitude + "," +
                                  position.coords.longitude +
                                  "&daddr=" + restaurant_location[0] + " " +
                                  restaurant_location.slice(-1)[0] + "&dirflg=w'> Walking directions </a>");
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

 