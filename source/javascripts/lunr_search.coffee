class @LunrSearch
  constructor: (elem, options) ->
    @$elem         = elem
    @$results      = $(options.results)
    @$entries      = $(options.entries, @$results)
    @indexDataUrl  = options.indexUrl

    @index = @createIndex()
    @template = @compileTemplate $(options.template)

    @init()

  init: ->
    @loadIndex (data) =>
      @populateIndex data
      @populateSearchFromQuery()
      @bindKeypress()

  createIndex: =>
    lunr ->
      @field "title",
        boost: 10
      @field "body"
      @ref "id"

  compileTemplate: (template) =>
    Handlebars.compile $(template).text()

  loadIndex: (callback) ->
    $.getJSON @indexDataUrl, (callback)

  populateIndex: (data) ->
    index = @index

    @entries = data.map((raw) ->
      id: raw.id + 1
      title: raw.title
      url: raw.url
      body: raw.content
      date: "#{raw.date.month}/#{raw.date.day}/#{raw.date.year}" if raw.date
      tags: raw.tags.join(",") if raw.tags
      category: raw.category
    )

    for entry in @entries
      index.add entry

  populateSearchFromQuery: =>
    uri = new URI(window.location.search.toString())
    queryString = uri.search(true)
    if queryString.hasOwnProperty("q")
      $(@$elem).val queryString.q
      @search queryString.q.toString()

  search: (query) =>
    entries = @entries
    if query.length <= 2
      @$results.hide()
      @$entries.empty()
    else
      #console.log @index.search(query)
      results = $.map(@index.search(query), (result) =>
        reference = parseInt(result.ref, 10)
        $.grep(entries, (entry) ->
          entry.id is parseInt(result.ref, 10)
        )[0]
      )
    @displayResults results if results

  displayResults: (entries) =>
    #console.log entries
    $entries = @$entries
    $results = @$results
    $entries.empty()
    if entries.length is 0
      $entries.append "<p>Nothing found.</p>"
    else
      $entries.append @template(entries: entries)
    $results.show()

  bindKeypress: =>
    input = $(@$elem)
    input.bind "keyup", debounce(=>
      @search input.val()
    )

  debounce = (fn) ->
    timeout = undefined
    slice = Array::slice
    =>
      args = slice.call(arguments)
      ctx = @
      clearTimeout timeout
      timeout = setTimeout(=>
        fn.apply ctx, args
      , 100)

