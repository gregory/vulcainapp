Vulcainapp.Views.Invoices ||= {}

class Vulcainapp.Views.Invoices.EditView extends Backbone.View
  template : JST["backbone/templates/invoices/edit"]

  events :
    "submit #edit-invoice" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (invoice) =>
        @model = invoice
        window.location.hash = "/invoices/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON()))

    this.$("form").backboneLink(@model)

    return this
