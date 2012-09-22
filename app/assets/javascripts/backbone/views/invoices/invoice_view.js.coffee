Vulcainapp.Views.Invoices ||= {}

class Vulcainapp.Views.Invoices.InvoiceView extends Backbone.View
  template: JST["backbone/templates/invoices/invoice"]

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
