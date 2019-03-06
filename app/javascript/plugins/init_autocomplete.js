import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('bike_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

const cityAutocomplete = () => {
  const cityInput = document.getElementByI('bike_city')
  if (cityInput) {
    places({ container: addressInput });
  }
  configure({
    type: 'city',
    aroundLatLngViaIP: false,
  });
};

export { initAutocomplete, cityAutocomplete };
