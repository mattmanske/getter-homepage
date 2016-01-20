#= require jquery

#= require_tree .

$ ->

  $emailBar      = $('.email-bar')
  $emailBtn      = $('.email-bar button')
  $freeTrialBtn  = $('.free-trial')
  $clickArrow    = $('.show-more-arrow')
  $hiddenSection = $('.hidden-wrapper')
  $jumbotron     = $('.jumbotron')
  $heroSection   = $('.jumbotron .container-fluid')

  #-----------  Email AJAX Function  -----------#

  sendUserEmail = -> return new Promise (fulfill, reject) ->
    user_email = $emailBar.find('input').val()

    # do stuff w/ the 'user_email' sting...

    if (Math.random() >= 0.5)
      # if has errors, send string via 'reject()' function
      message = "Whoops! #{user_email} Please try again"
      setTimeout( ->
        reject(message)
      , 2000)
    else
      # if no error, send string via 'fulfill()' function
      message = "Thanks! We'll be in touch soon"
      setTimeout( ->
        fulfill(message)
      , 2000)

  #-----------  Resize Hero Section  -----------#

  resizeHero = ->
    height = $heroSection.height()
    $jumbotron.css({minHeight: height + 180 + 'px'})

  $(window).on('resize', resizeHero)
  resizeHero()

  #-----------  Click to Show More  -----------#

  $clickArrow.click (evt) ->
    evt.preventDefault()
    $hiddenSection.addClass('visible')

    scrollHeight = $('#marketing .container-fluid').offset().top
    $('html, body').animate(scrollTop: scrollHeight, 750)

  setTimeout( ->
    $clickArrow.addClass('visible')
  , 500)

  #-----------  Click to Free Trial  -----------#

  $freeTrialBtn.click (evt) ->
    evt.preventDefault()
    $emailBar.removeClass('blink')

    scrollHeight = $emailBar.offset().top - ( $(window).height() - $emailBar.outerHeight(true) ) / 2
    $('html, body').animate(scrollTop: scrollHeight, 750)

    setTimeout( ->
      $emailBar.addClass('blink')
    , 900)

  #-----------  Email Animations  -----------#

  $emailBtn.click (evt) ->
    evt.preventDefault()
    $emailBar.toggleClass('sending')
    $emailBar.find('input, .btn').prop('disabled', true)

    revertState = ->
      $emailBtn.attr('data-message', '')
      $emailBar.removeClass('sending error finished')
      $emailBar.find('input, .btn').prop('disabled', false)

    sendUserEmail().then( (message) ->
      $emailBar.addClass('finished')
      $emailBtn.attr('data-message', message)
    , (message) ->
      $emailBar.addClass('error')
      $emailBtn.attr('data-message', message)

      setTimeout( ->
        revertState()
      , 3000)
    )
