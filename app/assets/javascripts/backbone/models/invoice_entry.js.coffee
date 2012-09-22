class Vulcainapp.Models.InvoiceEntry extends Backbone.Model
  paramRoot: 'project'

  defaults:
    name: null
    quantity: 0
    tva: 21

  constructor: (article_id) ->
    super()
    @article = Vulcainapp.datas.collections.articles.get(article_id).toJSON()  if article_id
    @total = 0
    @computeTotal()
    @

  toJSON: () ->
    _.extend(super, {article_id: @article.id})

  computeTotal: () ->
    total_without_vta = @article.price * @get('quantity')
    @total = total_without_vta * (1 + @get('tva')/100)
    @updateGrandTotal()
    @total.toFixed(2)

  updateGrandTotal: ()->
    Vulcainapp.instance.NewInvoiceModel.trigger('updateGrandTotal')

class Vulcainapp.Collections.InvoiceEntryCollection extends Backbone.Collection
  model: Vulcainapp.Models.InvoiceEntry
