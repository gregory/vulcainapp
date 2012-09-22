Vulcainapp.Views.Customers ||= {}

class Vulcainapp.Views.Customers.IndexView extends Backbone.View
  template: JST["backbone/templates/customers/index"]

  events:
    'keyup input[type="search"]': 'filterCustomerList'

  initialize: () ->
    @options.customers.bind('reset', @addAll)

  filterCustomerList: (e) ->
    terms = $(e.target).val()
    matcher = (customer) ->
      customer.get('name').match(new RegExp(terms, 'i')) || customer.get('email').match(new RegExp(terms, 'i'))
    list = Vulcainapp.datas.collections.customers.filter(matcher).map (e) ->
      e
    @$('tbody').html("")
    _.each(list, @addOne)

  addAll: () =>
    @options.customers.each(@addOne)

  addOne: (customer) =>
    view = new Vulcainapp.Views.Customers.CustomerView({model : customer})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(customers: @options.customers.toJSON() ))
    @addAll()

    return this
