# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ -> 
	url = location.href
	name = url.substring(url.lastIndexOf('/')+1)
	nameArr = name.split('.')
	name = nameArr[0]
	if name.length > 0
		element = document.getElementById(name)
		if element != null 
			$('#navilist > li').removeClass 'selected'
			element.className += ' selected'