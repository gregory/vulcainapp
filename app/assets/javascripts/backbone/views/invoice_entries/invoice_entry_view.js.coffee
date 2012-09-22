Vulcainapp.Views.InvoiceEntries ||= {}

class Vulcainapp.Views.InvoiceEntries.InvoiceEntryView extends Backbone.View
  template: JST["backbone/templates/invoice_entries/invoice_entry_view"]

  events:
    "click .destroy" : "destroy"
    "change .quantity, .tva": "updateEntryTotal"

  tagName: "tr"

  updateEntryTotal: ->
    @$('td.total').html(@model.computeTotal() + '€')
    return

  destroy: () ->
    @model.destroy()
    @model.updateGrandTotal()
    this.remove()
    return false

  render: ->
    @updateEntryTotal()
    data = _.extend(@model.toJSON(), {article: @model.article})
    $(@el).html(@template(data))
    $(@el).backboneLink(@model)
    @
