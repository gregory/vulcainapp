Vulcainapp.Views.Invoices ||= {}

class Vulcainapp.Views.Invoices.NewView extends Backbone.View
  template: JST["backbone/templates/invoices/new"]
  address: JST["backbone/templates/invoices/address"]

  events:
    "submit #new-invoice": "save"
    'change #project_id': 'selectProject'

  constructor: (options) ->
    super(options)
    @model = new @collection.model()
    @model.on("change:errors", @render)
    @model.on('totalUpdated', @updateGrandTotal)
    #todo: handle the leave event
    Vulcainapp.instance.NewInvoiceModel = @model
    @

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
    console.log @model
    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (invoice) =>
        @model = invoice
        window.location.hash = "/invoices/#{@model.id}"
      error: (invoice, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  updateGrandTotal: () =>
    #global context cause initialized from the constructor and needs this.model before @ is returned ;)
    @$('tfoot > tr > td.grandtotal').html(@model.grandTotal + '€')

  addInvoiceEntry: (entry) ->
    @model.addInvoiceEntry entry
    invoice_entry = new Vulcainapp.Views.InvoiceEntries.InvoiceEntryView(model: entry)
    @$('table#invoices-table').append(invoice_entry.render().el)
    @$('table#invoices-table tr:last').backboneLink(@model.invoice_entries.last())

  addAllInvoiceEntries: () ->
    @model.invoice_entries.each(@addInvoiceEntry)

  addNewInvoiceEntry: (article_id) ->
    @addInvoiceEntry(new Vulcainapp.Models.InvoiceEntry(article_id))

  selectProject: () ->
    project_id = @$('#project_id :selected').val()
    project = Vulcainapp.datas.collections.projects.get(project_id)
    if project
      @model.selectProject(project)
      @$('#project_title').html(project.get('name'))
      customer = project.customer()
      @$('.customer').html(@address(customer))

  render: ->
    $(@el).html(@template(@model.toJSON()))
    list = new Vulcainapp.Views.Articles.List()
    list.on('insertArticleWithId', @addNewInvoiceEntry, @)
    @$('.articles-list').html(list.render().el)
    @addAllInvoiceEntries()
    @selectProject()
    @updateGrandTotal()
    this.$("form").backboneLink(@model)
    @
