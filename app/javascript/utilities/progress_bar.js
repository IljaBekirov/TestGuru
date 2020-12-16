document.addEventListener('turbolinks:load', function () {
  var progress = document.querySelector('.bar-progress')
  var inx = 0

  if (progress) {
    // var percent = progress.dataset.percent
    // progress.style.width = percent + '%'

    var width = progress.dataset.percent
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
})