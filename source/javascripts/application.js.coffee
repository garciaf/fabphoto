#= require_tree ./lib
#= require_tree ./vendor
#= require bootstrap/util
#= require bootstrap/collapse

$ -> 
  $('.swipebox' ).swipebox
    useCSS : true
    removeBarsOnMobile : true
    loopAtEnd: true

  $('.preload-picture').each ->
    $el = $(@)
    src = "/#{$el.data('src')}"
    $.get(src)
      .done (data) ->
        $el.attr('src', src)
        $el.parent().removeClass('loading')
        $el.parent().removeClass('preload-picture')
        $el.addClass('in')

  $('.slide_show').vegas
    overlay: true
    transition: 'fade' 
    transitionDuration: 3000
    delay: 5000
    animation: 'random'
    animationDuration: 15000
    slides: [
      {src: '/images/cover1.jpg'}
      {src: '/images/cover5.jpg'}
      {src: '/images/cover2.jpg'}
      {src: '/images/cover4.jpg'}
    ]