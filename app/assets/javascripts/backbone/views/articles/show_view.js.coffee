Vulcainapp.Views.Articles ||= {}

class Vulcainapp.Views.Articles.ShowView extends Backbone.View
  template: JST["backbone/templates/articles/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
