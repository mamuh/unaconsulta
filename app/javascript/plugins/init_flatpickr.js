// First we define two variables that are going to grab our inputs field. You can check the ids of the inputs with the Chrome inspector.
const initFlatpickr = () => {
  const startDateInput = document.getElementById('booking_start_date');
  const endDateInput = document.getElementById('booking_end_date');
  // Check that the query selector id matches the one you put around your form.
  if (startDateInput) {
  flatpickr(startDateInput, {
    dateFormat: "Y-m-d",
  });
  startDateInput.addEventListener("change", (e) => {
    if (startDateInput != "") {
      endDateInput.disabled = false
    }
    flatpickr(endDateInput, {
      minDate: e.target.value,
      dateFormat: "Y-m-d"
      });
    })
  };
}

export { initFlatpickr };

