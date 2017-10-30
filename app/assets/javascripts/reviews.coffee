# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.star-rating').raty({
    path: '/assets/',
    readOnly: true,
    score: ->
      return $(this).attr('data-score')
  })

  $('#star-rating').raty({
    path: '/assets/',
    scoreName: 'review[rating]'
  })
