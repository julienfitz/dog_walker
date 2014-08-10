var marker,
    markers = [];

function initialize() {
  var mapOptions = {
    zoom: 12,
    center: new google.maps.LatLng(40.6606, -73.9611)
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
}

function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&' +
      'callback=initialize';
  document.body.appendChild(script);
}

window.onload = loadScript;

function placeMarkers(appointments) {
    var infowindow = new google.maps.InfoWindow();
    var icon = new google.maps.MarkerImage("http://maps.google.com/mapfiles/ms/icons/blue-dot.png");
    var bounds = new google.maps.LatLngBounds(stopPointLatLonObject);

    for (i = 0; i < appointments.length; i++) {  
      var position = new google.maps.LatLng(appointments[i][0], appointments[i][1])
      marker = new google.maps.Marker({
        position: position,
        map: map,
        icon: icon
      });
      bounds.extend(position);
      map.fitBounds(bounds);

      //marker listener
      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        console.log("Appointment: " + appointments[i][2]);
        return function() {
          $("#directions-panel").show();
          infowindow.setContent('<div class="infowindow"><p>' + appointments[i][3] + '<p><strong>' + appointments[i][2] + '</strong></p><p>' +appointments[i][4] + '</p></div>');
          infowindow.open(map, marker);
        }
      })(marker, i));
      markers.push(marker);
    }
  }
  // 0<%= appointment.latitude %>, 1<%= appointment.longitude %>, 2'<%= appointment.pet.name %>', 3'<%= appointment.date.strftime("%I:%M %p") %>', 4<%= appointment.pet.household.address %>