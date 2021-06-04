
  // For the next 3 days weather

const fetchDays = (cityName) => {
  const url = `https://api.openweathermap.org/data/2.5/forecast?q=${cityName}&appid=4a338578ef78d970b1eadfa4b114c117&units=metric`;
  const day1 = document.querySelector('#days1');
  const day1Icon = document.querySelector('#icon1');

  const day2 = document.querySelector('#days2');
  const day2Icon = document.querySelector('#icon2');

  const day3 = document.querySelector('#days3');
  const day3Icon = document.querySelector('#icon3');

  fetch (url)
  .then(response => response.json())
  .then((data) =>{
    const eachDays = data.list[8].main.temp
    day1.innerText =`${Math.round(eachDays)}°C`;
    day1Icon.src = `http://openweathermap.org/img/wn/${(data.list[8].weather[0].icon)}.png`;


    const eachDays2 = data.list[16].main.temp
    day2.innerText =`${Math.round(eachDays2)}°C`;
    day2Icon.src = `http://openweathermap.org/img/wn/${(data.list[16].weather[0].icon)}.png`;

    const eachDays3 = data.list[24].main.temp
   day3.innerText =`${Math.round(eachDays3)}°C`;
    day3Icon.src = `http://openweathermap.org/img/wn/${(data.list[24].weather[0].icon)}.png`;

  });
}

export{fetchDays}

