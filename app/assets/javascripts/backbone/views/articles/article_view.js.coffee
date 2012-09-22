Vulcainapp.Views.Articles ||= {}

class Vulcainapp.Views.Articles.ArticleView extends Backbone.View
  template: JST["backbone/templates/articles/article"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
