class Vulcainapp.Models.Article extends Backbone.Model
  paramRoot: 'article'

  defaults:
    title: null
    price: null
    description: null

class Vulcainapp.Collections.ArticlesCollection extends Backbone.Collection
  model: Vulcainapp.Models.Article
  url: '/api/articles'
