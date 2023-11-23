document.addEventListener('DOMContentLoaded', () => {
  document.querySelector('#sidebar h3')?.addEventListener('click', () => {
    document.querySelector('#sidebar .filter_form').classList.toggle('show')
  })
})