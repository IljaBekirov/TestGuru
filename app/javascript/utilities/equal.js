document.addEventListener('turbolinks:load', function () {
  var pass = document.getElementById('pass')
  var confirm_pass = document.getElementById('confirm_pass')

  pass.oninput = function () {
    if (pass.value === confirm_pass.value) {
      pass.classList.add('is-valid')
      pass.classList.remove('is-invalid')
      confirm_pass.classList.add('is-valid')
      confirm_pass.classList.remove('is-invalid')
    } else {
      pass.classList.add('is-invalid')
      pass.classList.remove('is-valid')
      confirm_pass.classList.add('is-invalid')
      confirm_pass.classList.remove('is-valid')
    }
  }

  confirm_pass.oninput = function () {
    if (pass.value === confirm_pass.value) {
      pass.classList.add('is-valid')
      pass.classList.remove('is-invalid')
      confirm_pass.classList.add('is-valid')
      confirm_pass.classList.remove('is-invalid')
    } else {
      pass.classList.add('is-invalid')
      pass.classList.remove('is-valid')
      confirm_pass.classList.add('is-invalid')
      confirm_pass.classList.remove('is-valid')
    }
  }
})
