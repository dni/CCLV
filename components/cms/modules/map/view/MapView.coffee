define [
  'cs!App'
  'cs!lib/view/MapView'
  'cs!./MapListView'
  'cs!./MapTrackListView'
  'cs!./MapSitesListView'
], (App, MapView, MapListView, MapTrackListView , MapSitesListView) ->
  class ExtendedMapView extends MapView

    afterRender:->
      @createMap()
      @startPositionTracking()
      @initDrawing()
      # @initChildren()
      # App.vent.on "newPosition", @centermap
      App.vent.on "ready", =>
        @findView = new MapListView collection: App.Finds
        @trackView = new MapTrackListView collection: App.Tracks
        @siteView = new MapSitesListView collection: App.Findsites
        @$el.append @findView.render().el
          , @trackView.render().el
          , @siteView.render().el


    initDrawing:->
      App.drawingManager = new App.google.drawing.DrawingManager
        drawingControl: true
        drawingControlOptions:
          position: App.google.ControlPosition.BOTTOM_LEFT
          drawingModes: [
            App.google.drawing.OverlayType.MARKER
            App.google.drawing.OverlayType.CIRCLE
            App.google.drawing.OverlayType.POLYGON
            App.google.drawing.OverlayType.POLYLINE
            App.google.drawing.OverlayType.RECTANGLE
          ]
      App.drawingManager.setMap App.map
