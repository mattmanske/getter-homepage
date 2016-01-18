#= require jquery

#= require_tree .

$ ->

  $('.show-more-arrow').click (evt) ->
    evt.preventDefault()
    $('.hidden-wrapper').addClass('visible')
    $('html, body').animate
      scrollTop: $('#marketing').offset().top
    , 750
