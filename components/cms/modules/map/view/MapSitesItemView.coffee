define [
  'marionette'
  'cs!App'
  'cs!lib/view/MapItemView'
], (Marionette, App, MapItemView ) ->

  class MapSitesItemView extends Marionette.ItemView

    latlng: ->
      pos = @model.getLocation()
      new App.google.LatLng pos.lat, pos.lng

    modelEvents:
      "change": "updateItem"
      "destroy": "destroyItem"

    render: ->
      @createItem()

    destroyItem:->
      @item.setMap null

    updateItem:->
      @destroyItem()
      @createItem()

    createItem: ->
      type = @model.get "type"
      if type is "polygon" then @createPolygon()
      if type is "polyline" then @createPolyline()
      if type is "circle" then @createCircle()

    getColor: ->
      category = App.Categories.findWhere(_id: @model.get("category"))
      if category
        return category.get "color"
      return "#000000"

    createCircle:->
      that = @
      circle = @model.get "points"
      @item = new App.google.Circle
        center: circle[0]
        radius: circle[1]
        strokeColor: @getColor()
        fillColor: @getColor()
        strokeOpacity: 1.0
        strokeWeight: 2
      @item.setMap App.map

    createPolygon:->
      that = @
      @item = new App.google.Polygon
        paths: @model.get "points"
        geodesic: true
        strokeColor: @getColor()
        fillColor: @getColor()
        strokeOpacity: 1.0
        strokeOpacity: 1.0
        strokeWeight: 2
      @item.setMap App.map

    createPolyline:->
      that = @
      @item = new App.google.Polyline
        paths: @model.get "points"
        geodesic: true
        strokeColor: @getColor()
        fillColor: @getColor()
        strokeOpacity: 1.0
        strokeOpacity: 1.0
        strokeWeight: 2
      @item.setMap App.map

