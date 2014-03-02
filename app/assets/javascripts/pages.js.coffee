# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

hilightLocationTab = ->
  path = location.pathname
  pathParts = path.split('/').filter(String) # Filter String to remove empty strings
  name = pathParts[0] # First actual element of path is the correct part of the URL
  $('#top-menu .nav-item').removeClass 'selected'
  if name?
    $('#'+name).addClass 'selected'
  else
    $('#index').addClass 'selected'

$ ->
  $(document).on 'page:update ready', (event, XHR, settings) ->
    hilightLocationTab()
    if $('#flash').contents().length > 2
      $('#flash').fadeOut 2500
