class Vulcainapp.Routers.ProjectsRouter extends Backbone.Router
  initialize: ->
    @projects =Vulcainapp.datas.collections.projects

  routes:
    "projects/new"      : "newProject"
    "projects/index"    : "index"
    "projects/:id/edit" : "edit"
    "projects/:id"      : "show"
    "projects"        : "index"

  newProject: ->
    @view = new Vulcainapp.Views.Projects.NewView(collection: @projects)
    $("#projects ").html(@view.render().el)

  index: ->
    @view = new Vulcainapp.Views.Projects.IndexView(projects: @projects)
    $("#projects ").html(@view.render().el)

  show: (id) ->
    project = @projects.get(id)

    @view = new Vulcainapp.Views.Projects.ShowView(model: project)
    $("#projects ").html(@view.render().el)

  edit: (id) ->
    project = @projects.get(id)

    @view = new Vulcainapp.Views.Projects.EditView(model: project)
    $("#projects ").html(@view.render().el)
