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
        @points.push
          lat: App.position.coords.latitude
          lng: App.position.coords.longitude
        @currentTrack.set "points", @points
        # @currentTrack.save()
        App.vent.once "newPosition", @newPosition

    toggleRecord: ->
      @recording = !@recording
      @changeButton()
      if @recording
        @currentTrack = @createNewModel()
        @points = []
        App[@Config.collectionName].create @currentTrack,
          wait:true
          success: =>
            App.vent.once "newPosition", @newPosition
      else
        @currentTrack.set "enddate", new Date()
        @currentTrack.set "date", new Date()
        dur = new Date(@currentTrack.get("enddate")).getTime() - new Date(@currentTrack.get("date")).getTime()
        dur = (dur / 1000 / 60).toFixed 2 # tstamp to float in hours
        @currentTrack.set "duration", dur
        @currentTrack.save()

      Router.navigate "#{@Config.moduleName}/map/", trigger:true
