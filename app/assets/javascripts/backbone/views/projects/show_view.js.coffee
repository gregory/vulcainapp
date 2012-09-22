Vulcainapp.Views.Projects ||= {}

class Vulcainapp.Views.Projects.ShowView extends Backbone.View
  template: JST["backbone/templates/projects/show"]

  render: ->
    h = _.extend(@model.toJSON(), {customer: @model.customer()})
    $(@el).html(@template(h))
    return this
