import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelector('.user_input');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };