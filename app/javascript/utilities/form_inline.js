document.addEventListener('turbolinks:load', function () {
  var controls =  $('.form-inline-link').on('click', formInlineLinkHandler)
  var errors = document.querySelector('.resource-errors')

  if (errors && controls.length) {
    var resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault()   // Избегает поведения по умолчанию

  var testId = this.dataset.testId // dataset - получение доступа к аттрибутам data-*
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  var $testTitle = $('.test-title[data-test-id="' + testId + '"]')
  var $formInLine = $('.form-inline[data-test-id="' + testId + '"]')

  $testTitle.toggle()
  $formInLine.toggle()

  if ($formInLine.is(':visible')) {
    link.textContent = 'Cancel'
  } else {
    link.textContent = 'Edit'
  }
}
