class Vulcainapp.Routers.CustomersRouter extends Backbone.Router
  initialize: (options) ->
    @customers = Vulcainapp.datas.collections.customers

  routes:
    "customers/new"      : "newCustomer"
    "customers/index"    : "index"
    "customers/:id/edit" : "edit"
    "customers/:id"      : "show"
    "customers"        : "index"

  newCustomer: ->
    @view = new Vulcainapp.Views.Customers.NewView(collection: @customers)
    $("#customers").html(@view.render().el)

  index: ->
    @view = new Vulcainapp.Views.Customers.IndexView(customers: @customers)
    $("#customers").html(@view.render().el)

  show: (id) ->
    customer = @customers.get(id)

    @view = new Vulcainapp.Views.Customers.ShowView(model: customer)
    $("#customers").html(@view.render().el)

  edit: (id) ->
    customer = @customers.get(id)

    @view = new Vulcainapp.Views.Customers.EditView(model: customer)
    $("#customers").html(@view.render().el)
