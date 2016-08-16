#= require_tree ./lib
#= require ./vendor/jquery.swipebox
#= require ./vendor/vegas
#= require ./vendor/bootstrap

$ -> 
  $('.swipebox' ).swipebox()

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