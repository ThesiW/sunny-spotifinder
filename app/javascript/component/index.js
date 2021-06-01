import { fetchWeather, fetchCurrentPositionWeather } from './component';
import { initSelect2 } from './plugins/init_select2';


initSelect2();


fetchWeather();


const form = document.querySelector('form');
const cityInput = document.getElementById('city-input');
form.addEventListener('submit', (event) => {
  event.preventDefault();
  fetchWeather(cityInput.value);
});

const currentLocationLink = document.getElementById('current-location');
currentLocationLink.addEventListener('click', fetchCurrentPositionWeather);
