define [
  'marionette'
  'cs!App'
  'cs!lib/view/MapItemView'
], (Marionette, App, MapItemView ) ->

  class MapTrackItemView extends Marionette.ItemView

    latlng: ->
      pos = @model.getLocation()
      new App.google.LatLng pos.lat, pos.lng

    modelEvents:
      "change": "updateTrack"
      "destroy": "destroyTrack"

    render: ->
      @createTrack()

    destroyTrack:->
      @track.setMap null

    updateTrack:->
      @destroyTrack()
      @createTrack()

    createTrack:->
      that = @
      @track = new google.maps.Polyline
        path: @model.get "points"
        geodesic: true
        strokeColor: '#FF0000'
        strokeOpacity: 1.0
        strokeWeight: 2
      @track.setMap App.map

