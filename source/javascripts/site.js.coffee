#= require jquery

#= require_tree .

$ ->

  $emailBar      = $('.email-bar')
  $emailButton   = $('.email-bar .btn')
  $clickArrow    = $('.show-more-arrow')
  $hiddenSection = $('.hidden-wrapper')

  #-----------  Click to Show More  -----------#

  $clickArrow.click (evt) ->
    evt.preventDefault()
    $hiddenSection.addClass('visible')
    $('html, body').animate(
      scrollTop: $('#marketing .container').offset().top
    , 750)

  #-----------  Show More Hide/Show  -----------#

  setTimeout( ->
    $clickArrow.addClass('visible')
  , 500)

  #-----------  Email Animations  -----------#

  $emailButton.click (evt) ->
    evt.preventDefault()
    $emailBar.toggleClass('sending')
    $emailBar.find('input').prop('disabled', true)

    setTimeout( ->
      $emailBar.addClass('finished')
    , 3000)
