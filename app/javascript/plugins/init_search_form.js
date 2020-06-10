const code = () => {
  const form = document.getElementById('main-form');
  // const queryString = window.location.search;
  // console.log(queryString);
  // const input = document.querySelector('.user_input').value;
  // console.log(input);
  form.action = '/properties';
  form.submit;
}

const code2 = () => {
  const form = document.getElementById('main-form');
  form.action = 'properties/find';
  form.submit;
}

const initSearchForm = () => {
  const leave = document.getElementById('leave-review');
  const find = document.getElementById('find');
  leave.addEventListener('click', code)
  find.addEventListener('click', code2)
};



export { initSearchForm };
