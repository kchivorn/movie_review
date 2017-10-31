$ ->
  movies = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '/movies/autocomplete?query=%QUERY',
      wildcard: '%QUERY'
    }
  });
  console.log("111111111")
  $('#query').typeahead(null, {
    source: movies
  });

  $('.tt-menu').on 'click', ->
    $('#search_form').submit()
