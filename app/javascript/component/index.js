// const url = 'http://api.openweathermap.org/data/2.5/weather?q=stockholm&appid=b50f083d1d13be8ea2fd58f620b84eec&units=metric'

import {initSelect2} from '../plugins/init_select2';
initSelect2()

const city = document.querySelector('#city');
const date = document.querySelector('#date');
const description = document.querySelector('#description');
const temperature = document.querySelector('#temperature');
const icon = document.querySelector('#icon');
const form = document.querySelector('#city-form');
const input = document.querySelector('#city-input');

export function fetchWeather(cityName) {
  fetch (`http://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=b50f083d1d13be8ea2fd58f620b84eec&units=metric`)
    .then(response => response.json())
    .then((data) => {
      city.innerText = data.name;
      const today  = new Date();
      const localOffset = data.timezone + today.getTimezoneOffset() * 60;
      const localDate = new Date(today.setUTCSeconds(localOffset));
      const options = {weekday: 'long', month: 'long', day: 'numeric', hour: 'numeric', minute: 'numeric'};
      const formattedDate = localDate.toLocaleDateString('en-us',options);
      date.innerText = formattedDate;
      description.innerText =data.weather[0].description;
      temperature.innerText = `${Math.round(data.main.temp)}°C`;
      icon.src = `http://openweathermap.org/img/wn/${data.weather[0].icon}.png`;
    });
}

form.addEventListener('submit',(event) =>{
  event.preventDefault();
   fetchWeather(input.value);
});

fetchWeather('Stockholm');
