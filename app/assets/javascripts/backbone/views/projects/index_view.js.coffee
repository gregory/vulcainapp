Vulcainapp.Views.Projects ||= {}

class Vulcainapp.Views.Projects.IndexView extends Backbone.View
  template: JST["backbone/templates/projects/index"]

  events:
    'keyup input[type="search"]': 'filterProjectList'

  initialize: () ->
    @options.projects.bind('reset', @addAll)

  filterProjectList: (e) ->
    terms = $(e.target).val()
    matcher = (project) ->
      project.get('name').match(new RegExp(terms, 'i'))
    list = Vulcainapp.datas.collections.projects.filter(matcher).map (e) ->
      e
    @$('tbody').html("")
    _.each(list, @addOne)

  addAll: () =>
    @options.projects.each(@addOne)

  addOne: (project) =>
    view = new Vulcainapp.Views.Projects.ProjectView({model : project})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(projects: @options.projects.toJSON() ))
    @addAll()

    return this
