# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  $('a[href*="#"]:not([href="#"])').click ->
    if location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname
      target = $(this.hash)
      # target = (target.length ? target : $('[name=' + this.hash.slice(1) +']'))
      if target.length
        $('html, body').animate({
          scrollTop: target.offset().top
        }, 800)
        return false
