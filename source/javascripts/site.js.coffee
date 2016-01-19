#= require jquery

#= require_tree .

$ ->

  $clickArrow    = $('.show-more-arrow')
  $hiddenSection = $('.hidden-wrapper')

  # Show More

  $clickArrow.click (evt) ->
    evt.preventDefault()
    $(@).removeClass('visible')
    $hiddenSection.addClass('visible')
    $('html, body').animate
      scrollTop: $('#marketing').offset().top
    , 750

  # Show More

  setTimeout ->
    $clickArrow.addClass('visible')
  , 500
