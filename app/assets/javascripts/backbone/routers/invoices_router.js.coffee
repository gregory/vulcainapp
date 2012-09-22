class Vulcainapp.Routers.InvoicesRouter extends Backbone.Router
  initialize: (options) ->
    @invoices = Vulcainapp.datas.collections.invoices

  routes:
    "invoices/new"      : "newInvoice"
    "invoices/index"    : "index"
    "invoices/:id/edit" : "edit"
    "invoices/:id"      : "show"
    "invoices"        : "index"

  newInvoice: ->
    @view = new Vulcainapp.Views.Invoices.NewView(collection: @invoices)
    $("#invoices").html(@view.render().el)

  index: ->
    @view = new Vulcainapp.Views.Invoices.IndexView(invoices: @invoices)
    $("#invoices").html(@view.render().el)

  show: (id) ->
    invoice = @invoices.get(id)

    @view = new Vulcainapp.Views.Invoices.ShowView(model: invoice)
    $("#invoices").html(@view.render().el)

  edit: (id) ->
    invoice = @invoices.get(id)

    @view = new Vulcainapp.Views.Invoices.EditView(model: invoice)
    $("#invoices").html(@view.render().el)
