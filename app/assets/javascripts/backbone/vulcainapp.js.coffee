#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Vulcainapp =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  datas:
    collections: {}
  instance: {}
  init: (options) ->
    Vulcainapp.datas.collections.customers = new Vulcainapp.Collections.CustomersCollection().reset options.customers
    Vulcainapp.datas.collections.projects = new Vulcainapp.Collections.ProjectsCollection().reset options.projects
    Vulcainapp.datas.collections.invoices = new Vulcainapp.Collections.InvoicesCollection().reset options.invoices
    Vulcainapp.datas.collections.articles = new Vulcainapp.Collections.ArticlesCollection().reset options.articles
  showTab: ->
    if active_tab = window.location.hash.match(new RegExp('#/?([a-zA-Z]*)', 'i'))
      $('a[href="#'+active_tab[1]+'"]').tab('show')

$ () ->
  Backbone.history.start()
  $('#menu a').click (e) ->
    $(@).tab('show')
  $(".datepicker").datepicker()
  $("a[rel=popover]").popover({placement: 'left'})
  Vulcainapp.showTab()

