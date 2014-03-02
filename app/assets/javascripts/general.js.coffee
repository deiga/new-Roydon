# A collection of general case functions

$ ->
  $(document).on 'ajaxSuccess', (event, XHR, settings) ->
    console.log "AjaxSuccess:", event, XHR, settings

  $(document).on 'ajaxError', (event, XHR, settings, errorThrown) ->
    console.log "AjaxError:",  event, XHR, settings, errorThrown

  $(document).on 'click', 'a[data-remote="true"]', ->
    console.log "RemoteLinkClick:", this
    console.log 'Url: ' + this.href
    history.pushState(null, '', this.href)

  # Track jquery links in google analytics
  $(document).ajaxSend (event, xhr, settings) ->
    if _gaq?
      _gaq.push ['_trackPageview', settings.url]
