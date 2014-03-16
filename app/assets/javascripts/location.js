$(document).ready(function(){
  $('input.location').click(function (e) {
    e.preventDefault();
    var url = document.querySelector('form.button_to').action;
    var lon = document.querySelector('.long');
    var lat = document.querySelector('.lat');
    var err = document.querySelector('.error');
    {
    if (navigator.geolocation)
      {
      navigator.geolocation.getCurrentPosition(findPosition);
      }
    else{x.innerHTML = "Geolocation is not supported by this browser.";}
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
            'longitude': position.coords.longitude
            },
        success: function (data) {
          return data;
        }
      });
    }

  function errorCallback(error) {
        alert('ERROR(' + error.code + '): ' + error.message);
    }
  });
});

 