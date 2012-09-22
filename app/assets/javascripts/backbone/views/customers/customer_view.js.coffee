Vulcainapp.Views.Customers ||= {}

class Vulcainapp.Views.Customers.CustomerView extends Backbone.View
  template: JST["backbone/templates/customers/customer"]

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
