class Vulcainapp.Routers.ArticlesRouter extends Backbone.Router
  initialize: (options) ->
    @articles = Vulcainapp.datas.collections.articles

  routes:
    "articles/new"      : "newArticle"
    "articles/index"    : "index"
    "articles/:id/edit" : "edit"
    "articles/:id"      : "show"
    "articles"        : "index"

  newArticle: ->
    @view = new Vulcainapp.Views.Articles.NewView(collection: @articles)
    $("#articles").html(@view.render().el)

  index: ->
    @view = new Vulcainapp.Views.Articles.IndexView(articles: @articles)
    $("#articles").html(@view.render().el)

  show: (id) ->
    article = @articles.get(id)

    @view = new Vulcainapp.Views.Articles.ShowView(model: article)
    $("#articles").html(@view.render().el)

  edit: (id) ->
    article = @articles.get(id)

    @view = new Vulcainapp.Views.Articles.EditView(model: article)
    $("#articles").html(@view.render().el)
