const code = (event) => {
  // event.preventDefault();
  const form = document.getElementById('main-form');
  form.action = '/properties/new';
  // form.submit();
}

const code2 = (event) => {
  // event.preventDefault();
  const form = document.getElementById('main-form');
  form.action = 'properties/find';
  // form.submit();
}

const initSearchForm = () => {
  const leave = document.getElementById('leave-review');
  const find = document.getElementById('find');
  $(".alert" ).fadeOut(12000);
  // const form = document.getElementById('main-form');
  // if (form) {
  //   form.preventDefault;
  // }
  if (leave) {
    leave.addEventListener('click', code)
  }
  if (find) {
    find.addEventListener('click', code2)
  }
};



export { initSearchForm };
