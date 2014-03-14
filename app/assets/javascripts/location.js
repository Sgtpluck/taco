$(document).ready(function(){
  $('.location').click(function (e) {
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
    }

  function errorCallback(error) {
        alert('ERROR(' + error.code + '): ' + error.message);
    }
  });
});

 