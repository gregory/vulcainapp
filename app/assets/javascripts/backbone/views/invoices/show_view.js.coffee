Vulcainapp.Views.Invoices ||= {}

class Vulcainapp.Views.Invoices.ShowView extends Backbone.View
  template: JST["backbone/templates/invoices/show"]

  addInvoiceEntry: (entry) ->
    @model.addInvoiceEntry entry
    invoice_entry = new Vulcainapp.Views.InvoiceEntries.InvoiceEntryView(model: entry)
    @$('table#invoices-table').append(invoice_entry.render().el)
    @$('table#invoices-table tr:last').backboneLink(@model.invoice_entries.last())

  addAllInvoiceEntries: () ->
    @model.invoice_entries.each(@addInvoiceEntry)

  render: ->
    $(@el).html(@template(@model.toJSON()))
    console.log @model
    @addAllInvoiceEntries()
    @
