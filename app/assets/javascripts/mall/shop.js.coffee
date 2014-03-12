# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
flash = (msg, type) ->
  $('#flash').fadeIn 500
  $('#flash').html("<div class='wrapper'><div class='rounded " + type + "'>" + msg + "</div></div>")
  $('#flash').fadeOut 2500

updateCart = (event, data, status, xhr) ->
  $('#shopping-cart').load(' #shopping-cart > *')
  flash(data.message, xhr.getResponseHeader('X-Message-Type'))

selectSubcategory = (subCategoryName) ->
  if subCategoryName? and subCategoryName.length > 0
    $('#category-menu li').removeClass 'selected'
    $('a#'+subCategoryName).parent().addClass 'selected'

productsInPath = ->
  location.pathname.indexOf('products') > 0

productsAndCategoriesInPath = ->
  location.pathname.indexOf('categories') > 0 and productsInPath()

hilightShopLocationTab = ->
  pathname = location.pathname
  pathParts = pathname.split '/'
  name = pathParts[pathParts.length-1] # Last item of pathname is either the category or it isn't anything
  [categoryName, subCategoryName] = name.split '~'
  if !productsInPath() or productsAndCategoriesInPath()
    $('#shop-menu li').removeClass 'selected'
  if categoryName? and categoryName.length > 0
    $('a#'+categoryName).parent().addClass 'selected'
    selectSubcategory(subCategoryName)

$ ->
  $(document).on 'page:update ready', (event, XHR, settings) ->
    hilightShopLocationTab()

$ ->
  $('.add-to-cart')
    .on 'ajax:success', updateCart

$ ->
  $('.edit_shop_product')
    .on 'ajax:success', updateCart
