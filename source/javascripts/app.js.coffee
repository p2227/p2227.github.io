#= require ./libs/jquery.min
#= require ./libs/lunr.min
#= require ./libs/handlebars
#= require ./libs/jXHR
#= require ./libs/URI.min
#= require ./libs/swfobject-dynamic
#= require modernizr-2.0
#= require octopress
#= require lunr_search

$(document).ready ->
  new LunrSearch '#search-query',
                 indexUrl: "/search.json",
                 results: "#search-results",
                 entries: ".entries",
                 template: "#search-results-template"
