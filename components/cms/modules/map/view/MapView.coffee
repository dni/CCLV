define [
  'cs!App'
  'cs!lib/view/MapView'
  'cs!lib/view/MapItemView'
], (App, MapView, MapItemView ) ->
  class ExtendedMapView extends MapView

    afterRender:->
      @createMap()
      @startPositionTracking()
      # @initChildren()
      @childView = new MapItemView collection: App.Finds
      @$el.append @childView.render().el


