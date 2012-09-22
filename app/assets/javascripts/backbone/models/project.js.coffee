class Vulcainapp.Models.Project extends Backbone.Model
  paramRoot: 'project'

  defaults:
    name: null

  toJSON:  ->
    h = {}
    h = {customer: @customer()} if @get('customer_id')
    _.extend(super, h)

  customer: ->
    customer_id = @get('customer_id')

    if customer_id
      data = Vulcainapp.datas.collections.customers.get(customer_id)
      data.toJSON() if data
    else
      null

class Vulcainapp.Collections.ProjectsCollection extends Backbone.Collection
  model: Vulcainapp.Models.Project
  url: '/api/projects'
