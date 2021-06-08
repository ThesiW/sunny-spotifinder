var myArray = [
  @spot.name.all
];

var randomItem = myArray[Math.floor(Math.random()*myArray.length)];

document.body.innerHTML = randomItem;
