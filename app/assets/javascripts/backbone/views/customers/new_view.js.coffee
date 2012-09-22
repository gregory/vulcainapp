Vulcainapp.Views.Customers ||= {}

class Vulcainapp.Views.Customers.NewView extends Backbone.View
  template: JST["backbone/templates/customers/new"]

  events:
    "submit #new-customer": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (customer) =>
        @model = customer
        window.location.hash = "/#customers"

      error: (customer, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
