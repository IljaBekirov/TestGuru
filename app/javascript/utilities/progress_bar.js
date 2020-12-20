document.addEventListener('turbolinks:load', function () {
  var progress = document.querySelector('.bar-progress')
  var inx = 0

  if (progress) {
    var width = progress.dataset.percent
    if (width === '0') {
      progress.style.width = '0%'
    } else {
      var id = setInterval(frame, 30)

      function frame() {
        if (inx >= width) {
          clearInterval(id)
        } else {
          inx++
          progress.style.width = inx + '%'
          progress.innerHTML = inx + '%'
        }
      }
    }
  }
})