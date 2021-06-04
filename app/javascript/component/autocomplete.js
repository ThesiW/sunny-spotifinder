import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('city-auto-complete');
  console.log(addressInput)
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
