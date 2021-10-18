document.addEventListener('turbolinks:load', () => {
  flatpickr.localize(flatpickr.l10ns.ja)
  const TODAY = new Date(new Date().setHours(0, 0, 0, 0))
  const A_MONTH_AGO = new Date(TODAY.getFullYear(), TODAY.getMonth() - 1, TODAY.getDate())
  const A_MONTH_AHEAD = new Date(TODAY.getFullYear(), TODAY.getMonth() + 2, TODAY.getDate())
  flatpickr('#date-form', {
    disableMobile: true,
    maxDate: A_MONTH_AHEAD,
    minDate: A_MONTH_AGO,
    defaultDate: TODAY,
    dateFormat: 'Y/m/d (D)'
  });
})
