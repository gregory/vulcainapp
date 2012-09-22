class Vulcainapp.Models.Invoice extends Backbone.Model
  paramRoot: 'invoice'

  defaults:
    title: null
    issue_date: new Date().toJSON()
    due_date: new Date().toJSON()
    header: "Veuillez trouver ci joint le détail de la facture"
    footer: 'Merci pour votre confiance, à bientôt'
    project_id: null
    invoice_entries_attributes: null

  toJSON: () ->
    if @get('invoice_entries')

      h = {invoice_entries_attributes: @get('invoice_entries').toJSON()}
    else if @invoice_entries
      h = {invoice_entries_attributes: @invoice_entries.toJSON()}
    else
      h = {}

    _.extend(super, h)


  prepare: () ->
    project_id = @get('project_id')
    if project_id then @attributes['project'] = Vulcainapp.datas.collections.projects.get(project_id).toJSON()


  addInvoiceEntry: (entry) ->
    @invoice_entries.add entry

  selectProject: (project) ->
    @set('project_id', project.get('id'))

  updateGrandTotal: () ->
    operation = (memo, total) ->
      return memo + total
    elements = @invoice_entries.map (em) ->
      em.total
    @grandTotal = _.reduce(elements, operation ,0).toFixed(2)
    @trigger('totalUpdated')
    @grandTotal

  initialize: () ->
    @invoice_entries = new Vulcainapp.Collections.InvoiceEntryCollection()
    @grandTotal = 0
    @on('updateGrandTotal', @updateGrandTotal)

class Vulcainapp.Collections.InvoicesCollection extends Backbone.Collection
  model: Vulcainapp.Models.Invoice
  url: '/api/invoices'
