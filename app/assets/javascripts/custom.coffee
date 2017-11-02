$ ->
  movies = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '/movies/autocomplete?query=%QUERY',
      wildcard: '%QUERY'
    }
  });

  search = $('#query')

  search.typeahead(
    highlight: true
  , {
    source: movies
  }).bind 'typeahead:render', (e) ->
      $('.tt-suggestion.tt-selectable:first').addClass('tt-cursor')

  $('.tt-menu').on 'click', ->
    $('#search_form').submit()

  search.on 'keydown', (event) ->
    e = jQuery.Event("keydown")
    e.keyCode = e.which = 40

    if (event.which == 13)
      event.stopPropagation()
      search.triggerHandler(e)
      e.keyCode = e.which = 9
      search.triggerHandler(e)
