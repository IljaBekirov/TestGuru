document.addEventListener('turbolinks:load', function() {
  var timerView = document.querySelector('.timer')

  if (timerView) {
    var timers = timerView.dataset.timer

    setInterval(function() {
      if (timers > 0) {
        timers -= 1
        if (timers % 60 < 10) {
          var sec = '0' + timers % 60
        } else {
          var sec = timers % 60
        }
        resultTime = parseInt(timers / 60) + ':' + sec

        timers_percent = 100 * timers / timerView.dataset.timer
        timerView.style.width = timers_percent + '%'
        timerView.innerHTML = resultTime
      } else {
        alert('Ваше время вышло!')
        document.querySelector('form').submit()
      }
    }, 1000)
  }
})