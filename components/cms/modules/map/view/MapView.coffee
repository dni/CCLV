define [
  'cs!App'
  'cs!lib/view/MapView'
  'cs!./MapListView'
], (App, MapView, MapListView ) ->
  class ExtendedMapView extends MapView

    afterRender:->
      @createMap()
      @startPositionTracking()
      # @initChildren()
      App.vent.on "ready", =>
        @childView = new MapListView collection: App.Finds
        @$el.append @childView.render().el


