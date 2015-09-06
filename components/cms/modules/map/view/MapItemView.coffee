define [
  'cs!App'
  'cs!lib/view/MapItemView'
], (App, MapItemView ) ->

  class ExtendedMapItemView extends MapItemView

    getIcon: ->
      color = App.Categories.findWhere(_id: @model.get("category")).get "color"
      path = App.Subcategories.findWhere(_id: @model.get("subcategory")).get "symbol"
      size = App.Subcategories.findWhere(_id: @model.get("subcategory")).get "size"
      strokeColor: color
      path:App.google.SymbolPath[path]
      scale: size or 5


