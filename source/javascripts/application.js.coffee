#= require_tree ./lib
#= require_tree ./vendor
#= require bootstrap/util
#= require bootstrap/collapse

$ -> 
  $('.swipebox' ).swipebox(
    useCSS : true
    removeBarsOnMobile : true
    loopAtEnd: true
  )

  $('.slide_show').vegas(
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
  )