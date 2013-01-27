# A collection of general case functions

$ ->
  $(document).on 'ajaxSuccess', (event, XHR, settings) ->
    console.log "AjaxSuccess:", event, XHR, settings

  $(document).on 'ajaxError', (event, XHR, settings, errorThrown)->
    console.log "AjaxError:",  event, XHR, settings, errorThrown

  $(document).on 'click', 'a[data-remote="true"]', ->
    console.log "RemoteLinkClick:", this
    console.log 'Url: ' + this.href
    history.pushState(null, '', this.href)

  $(document).on 'click', '[data-remote="true"] input[type="submit"]', ->
    console.log "RemoteButtonClick:", this
    parent = $(this).parent()
    if parent.attr('method') == 'get'
      url = parent.attr('action') + '?' + parent.serialize()
      console.log "Url: " + url
      history.pushState(null, '', url)

  $(window).on 'popstate', ->
    console.log 'Popstate!', $(this)
    $.getScript(location.href)
