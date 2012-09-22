class Vulcainapp.Models.Customer extends Backbone.Model
  paramRoot: 'customer'

  defaults:
    name: null
    email: null

    #projects:
    #projects = new Vulcainapp.Collections.ProjectsCollection Vulcainapp.datas.collections.projects.where({customer_id: @id })

class Vulcainapp.Collections.CustomersCollection extends Backbone.Collection
  model: Vulcainapp.Models.Customer
  url: '/api/customers'
