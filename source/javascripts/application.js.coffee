#= require_tree ./lib
#= require ./vendor/jquery.swipebox
#= require ./vendor/vegas
#= require ./vendor/bootstrap

$ -> 
  $('.swipebox' ).swipebox()

  $('.slide_show').vegas(
    overlay: true
    transition: 'fade' 
    transitionDuration: 4000
    delay: 10000
    animation: 'random'
    animationDuration: 20000
    slides: [
      {src: '/images/cover1.jpg'}
      {src: '/images/cover2.jpg'}
      {src: '/images/cover3.jpg'}
    ]
  )