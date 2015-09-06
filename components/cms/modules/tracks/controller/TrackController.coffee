define [
  'cs!App'
  'cs!Router'
  'cs!lib/controller/Controller'
],
( App, Router, Controller ) ->

  class TrackController extends Controller

    recording: false
    currentTrack: {}

    after: ->
      that = @
      @on "afterRenderTopView", =>
        @toggleRecordButton = @topview.$el.find "#toggleRecord"
        @changeButton()

    changeButton: ->
      if @recording
        @toggleRecordButton.html '<span class="glyphicon glyphicon-stop"></span>'
      else
        @toggleRecordButton.html '<span class="glyphicon glyphicon-record"></span>'

    newPosition: =>
      if @recording
        points = @currentTrack.get "points"
        points.push
          lat: App.position.coords.latitude
          lng: App.position.coords.longitude
        @currentTrack.set "points", points
        @currentTrack.set "date", new Date()
        @saveTrack()
        App.vent.once "newPosition", @newPosition

    toggleRecord: ->
      @recording = !@recording
      @changeButton()
      if @recording
        App.vent.once "newPosition", @newPosition
        @currentTrack = @createNewModel()
        @currentTrack.set "points", []
        @currentTrack.set "start", new Date()
      else
        @currentTrack.set "end", new Date()
        @saveTrack()

      Router.navigate "#{@Config.moduleName}/map/", trigger:true

    saveTrack: (done)->
      @currentTrack.set "date", new Date()
      if @currentTrack.isNew()
        App[@Config.collectionName].create @currentTrack,
          success: (res) =>
      else
        @currentTrack.save()
