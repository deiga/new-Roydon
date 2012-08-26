# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  url = location.href
  nameArr = url.split('/')
  name = nameArr[3]
  if name.length > 0
    element = document.getElementById(name)
    $('#navilist > li').removeClass 'selected'
    if element != null
      element.className += ' selected'
  else
    $('#index').addClass 'selected'

$ ->
  $('#flash').fadeOut 2000
