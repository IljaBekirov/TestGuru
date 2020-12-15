document.addEventListener('turbolinks:load', function () {
  var pass = document.getElementById('pass')
  var confirm_pass = document.getElementById('confirm_pass')

  if (pass !== null && confirm_pass !== null) {
    pass.oninput = function () {
      checkPassValue(pass, confirm_pass)
    }

    confirm_pass.oninput = function () {
      checkConfirmPassValue(pass, confirm_pass)
    }
  }
})

function checkPassValue(pass, confirm_pass) {
  if (pass.value !== '') {
    findEqual(pass, confirm_pass)
  } else {
    clearClass(pass, confirm_pass)
  }
}

function checkConfirmPassValue(pass, confirm_pass) {
  if (confirm_pass.value !== '') {
    findEqual(pass, confirm_pass)
  } else {
    clearClass(pass, confirm_pass)
  }
}

function findEqual(pass, confirm_pass) {
  if (pass.value === confirm_pass.value) {
    addValidClass(pass, confirm_pass)
  } else {
    addInValidClass(pass, confirm_pass)
  }
}

function clearClass(pass, confirm_pass) {
  confirm_pass.classList.remove('is-valid')
  confirm_pass.classList.remove('is-invalid')
  pass.classList.remove('is-valid')
  pass.classList.remove('is-invalid')
}

function addValidClass(pass, confirm_pass) {
  pass.classList.add('is-valid')
  pass.classList.remove('is-invalid')
  confirm_pass.classList.add('is-valid')
  confirm_pass.classList.remove('is-invalid')
}

function addInValidClass(pass, confirm_pass) {
  pass.classList.add('is-invalid')
  pass.classList.remove('is-valid')
  confirm_pass.classList.add('is-invalid')
  confirm_pass.classList.remove('is-valid')
}