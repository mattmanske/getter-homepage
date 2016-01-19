#= require jquery

#= require_tree .

$ ->

  $emailBar      = $('.email-bar')
  $emailButton   = $('.email-bar .btn')
  $clickArrow    = $('.show-more-arrow')
  $hiddenSection = $('.hidden-wrapper')

  #-----------  Email AJAX Function  -----------#

  sendUserEmail = -> return new Promise (fulfill, reject) ->
    user_email = $emailBar.find('input').val()

    # do stuff w/ the 'user_email' sting...

    if (Math.random() >= 0.5)
      # if has errors, send string via 'reject()' function
      err_msg = "Whoops! #{user_email} Please try again"
      setTimeout( ->
        reject(err_msg)
      , 2000)
    else
      # if no errors, call 'fulfill()' function
      setTimeout( ->
        fulfill()
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

    sendUserEmail().then( ->
      console.log 'SUCCESS!'
      $emailBar.addClass('finished')
    , (error_message) ->
      console.log 'ERROR: ' + error_message
      $emailBar.addClass('error')
      setTimeout( ->
        $emailBar.removeClass('sending error')
        $emailBar.find('input, .btn').prop('disabled', false)
      , 2000)
    )
