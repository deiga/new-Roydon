# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  url = location.href
  nameArr = url.split('/')
  name = nameArr[5]
  if name? && name.length > 0
    element = document.getElementById(name)
    $('#shop_navi > li').removeClass 'selected'
    if element != null
      element.parentNode.className += ' selected'
