Vulcainapp.Views.Articles ||= {}

class Vulcainapp.Views.Articles.IndexView extends Backbone.View
  template: JST["backbone/templates/articles/index"]

  events:
    'keyup input[type="search"]': 'filterArticleList'

  initialize: () ->
    @options.articles.bind('reset', @addAll)

  filterArticleList: (e) ->
    terms = $(e.target).val()
    matcher = (article) ->
      article.get('title').match(new RegExp(terms, 'i')) || article.get('description').match(new RegExp(terms, 'i'))
    list = Vulcainapp.datas.collections.articles.filter(matcher).map (e) ->
      e
    @$('tbody').html("")
    _.each(list, @addOne)

  addAll: () =>
    @options.articles.each(@addOne)

  addOne: (article) =>
    view = new Vulcainapp.Views.Articles.ArticleView({model : article})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(articles: @options.articles.toJSON() ))
    @addAll()

    return this
