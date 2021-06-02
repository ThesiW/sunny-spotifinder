
// const mapboxKey = 'https://api.mapbox.com/geocoding/v5/mapbox.places/Los%20Angeles.json?access_token=pk.eyJ1Ijoic2FtaXJzaWx3YWx3MzE2IiwiYSI6ImNrb2ZsNXg0aTBnOXQydmx6YjRsc3JzcW0ifQ.wpGVyOyjwwlXmzExFlPAmQ';

// import mapboxgl from 'mapbox-gl';

// const injectCoordinates = (coordinates) => {
//   const paragraphElement = document.getElementById('coordinates');
//   paragraphElement.innerText = `${coordinates.lat}, ${coordinates.lng}`;
// };

// const injectMap = (coordinates) => {
//   const lng = coordinates.lng;
//   const lat = coordinates.lat;

//   const mapDiv = document.getElementById('map');
//   mapDiv.innerHTML = '';

//   mapboxgl.accessToken = 'pk.eyJ1Ijoic2FtaXJzaWx3YWx3MzE2IiwiYSI6ImNrb2ZsNXg0aTBnOXQydmx6YjRsc3JzcW0ifQ.wpGVyOyjwwlXmzExFlPAmQ';
//   const map = new mapboxgl.Map({
//     container: 'map',
//     style: 'mapbox://styles/mapbox/streets-v9',
//     center: [lng, lat],
//     zoom: 12
//   });
//   new mapboxgl.Marker()
//     .setLngLat([lng, lat])
//     .addTo(map);
// };




// export const formElement = document.getElementById('searchForm');
// formElement.addEventListener('submit', (event) => {
//   // prevent form's default behavior
//   event.preventDefault();

//   // get input value
//   const address = document.getElementById('address').value;
//   const mapboxKey = 'yourApiKey';
//   // trigger request to Google Maps API
//   fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${address}.json?access_token=${mapboxKey}`)
//     .then(response => response.json())
//     .then((data) => {
//       const coordinates = {
//         lng: data.features[0].geometry.coordinates[0],
//         lat: data.features[0].geometry.coordinates[1]
//       };
//       injectCoordinates(coordinates);
//       injectMap(coordinates);
//     });
// });


// export { injectCoordinates, injectMap };








  mapboxgl.accessToken = 'pk.eyJ1Ijoic2FtaXJzaWx3YWx3MzE2IiwiYSI6ImNrb2ZsNXg0aTBnOXQydmx6YjRsc3JzcW0ifQ.wpGVyOyjwwlXmzExFlPAmQ';
    var geocoder = new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        types: 'country,region,place,postcode,locality,neighborhood'
    });

    geocoder.addTo('#geocoder');

    // Get the geocoder results container.
    var results = document.getElementById('result');

    // Add geocoder result to container.
    geocoder.on('result', function (e) {
        results.innerText = JSON.stringify(e.result, null, 2);
    });

    // Clear results container when search is cleared.
    geocoder.on('clear', function () {
        results.innerText = '';
    });



