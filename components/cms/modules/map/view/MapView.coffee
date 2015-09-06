define [
  'cs!App'
  'cs!lib/view/MapView'
  'cs!./MapItemView'
], (App, MapView, MapItemView ) ->
  class ExtendedMapView extends MapView

    afterRender:->
      @createMap()
      @startPositionTracking()
      # @initChildren()
      App.vent.on "ready", =>
        @childView = new MapItemView collection: App.Finds
        @$el.append @childView.render().el


