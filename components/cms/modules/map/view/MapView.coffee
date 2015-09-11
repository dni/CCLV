define [
  'cs!App'
  'cs!lib/view/MapView'
  'cs!./MapListView'
  'cs!./MapTrackListView'
], (App, MapView, MapListView, MapTrackListView ) ->
  class ExtendedMapView extends MapView

    afterRender:->
      @createMap()
      @startPositionTracking()
      # @initChildren()
      # App.vent.on "newPosition", @centermap
      App.vent.on "ready", =>
        @findView = new MapListView collection: App.Finds
        @trackView = new MapTrackListView collection: App.Tracks
        @$el.append @findView.render().el, @trackView.render().el


