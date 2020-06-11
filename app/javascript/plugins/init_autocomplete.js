import places from 'places.js';
import mapboxgl from 'mapbox-gl';
import { code } from "./init_mapbox";

const initAutocomplete = () => {
  const addressInput = document.querySelector('.user_input');

  if (addressInput) {
    const plc = places({ container: addressInput });
    plc.on('change', e => {
      const mapElement = document.getElementById('map');
      if (mapElement) {
        const marker = e.suggestion.latlng;
        const map = new mapboxgl.Map({
          container: 'map',
          style: 'mapbox://styles/mapbox/streets-v10',
          center: [-79.4512, 43.6568],
        });
        const markers = JSON.parse(mapElement.dataset.markers);
        if (markers.length >= 1) {
          markers.forEach((marker) => {
          code(map, marker)
          });

          }
        code(map, marker);
        map.flyTo({center: [e.suggestion.latlng.lng, e.suggestion.latlng.lat], zoom: 13});
      };
    });
  }
};


export { initAutocomplete };
