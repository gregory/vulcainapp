Vulcainapp.Views.Projects ||= {}

class Vulcainapp.Views.Projects.NewView extends Backbone.View
  template: JST["backbone/templates/projects/new"]

  events:
    "submit #new-project": "save"

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
    @model.unset("customer")

    @collection.create(@model.toJSON(true),
      success: (project) =>
        @model = project
        window.location = "/#/projects"

      error: (project, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON()))

    this.$("form").backboneLink(@model)

    return this
