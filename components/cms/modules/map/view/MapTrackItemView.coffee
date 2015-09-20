define [
  'marionette'
  'cs!App'
  'cs!Router'
  'cs!lib/view/MapItemView'
], (Marionette, App, Router, MapItemView ) ->

  class MapTrackItemView extends Marionette.ItemView

    latlng: ->
      pos = @model.getLocation()
      new App.google.LatLng pos.lat, pos.lng

    modelEvents:
      "change": "updateTrack"
      "destroy": "destroyTrack"

    render: ->
      @createTrack()

    getColor: ->
      model = App.Users.findWhere(_id: @model.get("cruser"))
      if model
        return model.get "color"
      return "#000000"

    destroyTrack:->
      @track.setMap null
      App.google.event.removeListener @listener

    updateTrack:->
      @destroyTrack()
      @createTrack()

    createTrack:->
      that = @
      @track = new google.maps.Polyline
        path: @model.get "points"
        geodesic: true
        strokeColor: @getColor()
        strokeOpacity: 1.0
        strokeWeight: 2
      @track.setMap App.map
      @listener = App.google.event.addListener @track, 'click', =>
        Router.navigate @model.getHref(), trigger:true

