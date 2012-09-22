Vulcainapp.Views.Articles ||= {}

class Vulcainapp.Views.Articles.List extends Backbone.View
  template: JST["backbone/templates/articles/list"]
  article_list: JST['backbone/templates/articles/article_list']

  className: 'right_column'
  events:
    'keyup input[type="search"]': 'filterArticleList'
    'click .articles-list li > a': 'triggerInsertArticle'

  initialize: ->
    @collection = Vulcainapp.datas.collections.articles

  triggerInsertArticle: (e) ->
    @trigger('insertArticleWithId', $(e.target).parent().data('id'))


  filterArticleList: (e) ->
    terms = $(e.target).val()
    matcher = (article) ->
      article.get('title').match(new RegExp(terms, 'i'))
    list = Vulcainapp.datas.collections.articles.filter(matcher).map (e) ->
      e.toJSON()
    @$('ul').html(@article_list(article_list: list))
    $("a[rel=popover]").popover({placement: 'left'})


  render: (list = Vulcainapp.datas.collections.articles.toJSON()) ->
    $(@el).html(@template())
    @$('ul').html(@article_list(article_list: list))
    @
