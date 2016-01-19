#= require jquery

#= require_tree .

$ ->

  $emailBar      = $('.email-bar')
  $emailBtn      = $('.email-bar button')
  $freeTrialBtn  =
  $clickArrow    = $('.show-more-arrow')
  $hiddenSection = $('.hidden-wrapper')

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

  #-----------  Start Free Trial  -----------#

  $emailButton.click (evt) ->
    evt.preventDefault()
    $emailBar.toggleClass('sending')
    $emailBar.find('input, .btn').prop('disabled', true)

    revertState = ->
      $emailButton.attr('data-message', '')
      $emailBar.removeClass('sending error finished')
      $emailBar.find('input, .btn').prop('disabled', false)

    sendUserEmail().then( (message) ->
      $emailButton.attr('data-message', message)
      $emailBar.addClass('finished')
      console.log 'SUCCESS!', message
    , (message) ->
      $emailButton.attr('data-message', message)
      $emailBar.addClass('error')
      console.log 'ERROR: ' + message

      setTimeout( ->
        revertState()
      , 3000)
    )
