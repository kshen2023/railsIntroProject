document.addEventListener('DOMContentLoaded', function () {
    if (document.getElementById('map')) {
        initMap();
    }
});

function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 4,
        center: { lat: -25.363, lng: 131.044 }
    });

    var locations = JSON.parse(document.getElementById('map').dataset.locations);

    locations.forEach(function (location) {
        new google.maps.Marker({
            position: { lat: location.latitude, lng: location.longitude },
            map: map,
            title: location.name
        });
    });
}
