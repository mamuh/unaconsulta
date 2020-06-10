const code = () => {
  const form = document.getElementById('main-form');
  const queryString = window.location.search;
  console.log(queryString);
  // const input = document.querySelector('.user_input').value;
  // console.log(input);
  form.action = '/properties';
  form.submit;
}

const initSearchForm = () => {
  const leave = document.getElementById('leave-review');
  leave.addEventListener('click', code)
};



export { initSearchForm };
