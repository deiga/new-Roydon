# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
flash = (msg, type) ->
  $('#flash').append("<div class='wrapper'><div class='rounded " + type + "'>" + msg + "</div></div>")
  # $('#flash').fadeOut 2500

$ ->
  url = location.href
  nameArr = url.split('/')
  name = nameArr[5]
  if name? && name.length > 0
    element = document.getElementById(name)
    $('#shop_navi > li').removeClass 'selected'
    if element != null
      element.parentNode.className += ' selected'

$ ->
  $('.add-to-cart')
    .on 'ajax:success', (event, data, status, xhr) =>
      $(this).parents('div.article').find('.details').html('<div>Title: ' + data.title + '</div>' +'<div>Body: ' + data.body + '</div>')
      $('#shopping_cart').load(' #shopping_cart > *')
