#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require twitter/bootstrap

$ -> Quizz.init()
$(document).on('page:load', => Quizz.init())


Quizz = {
  init: ->
    $('.answer').on 'click', (ev) ->
      ans = $(ev.target).parents('.answer')
      console.log ans
      $('.answer').removeClass('selected')
      ans.addClass('selected')

    if timer = $('#timer')
      seconds = timer.data('seconds')
      span = timer.find('#seconds')
      setInterval ->
        span.html(seconds)
        seconds -=1
        if seconds <= 0
          window.location.href = '/'
      , 1000
}