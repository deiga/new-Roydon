# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
flash = (msg, type) ->
  $('#flash').append("<div class='wrapper'><div class='rounded " + type + "'>" + msg + "</div></div>")
  $('#flash').fadeOut 2500

updateCart = (event, data, status, xhr) ->
  $('#shopping-cart').load(' #shopping-cart > *')
  flash(data.message, xhr.getResponseHeader('X-Message-Type'))

selectSubcategory = (subCategoryName) ->
  if subCategoryName? and subCategoryName.length > 0
    $('#category-menu li').removeClass 'selected'
    $('a#'+subCategoryName).parent().addClass 'selected'

hilightShopLocationTab = ->
  pathParts = location.pathname.split '/'
  name = pathParts[pathParts.length-1] # Last item of pathname is either the category or it isn't anything
  [categoryName, subCategoryName] = name.split '~'
  if categoryName? and categoryName.length > 0
    $('#shop-navi > li').removeClass 'selected'
    $('a#'+categoryName).parent().addClass 'selected'
    selectSubcategory(subCategoryName)

$ ->
  hilightShopLocationTab()

  $(document).on 'ajaxSuccess', (event, XHR, settings) ->
    hilightShopLocationTab()

$ ->
  $(document).on 'submit','form[data-pjax]', (event) ->
    $.pjax.submit(event, 'section#shop-details')


$ ->
  $('.add-to-cart')
    .on 'ajax:success', updateCart

$ ->
  $('.edit_shop_product')
    .on 'ajax:success', updateCart
