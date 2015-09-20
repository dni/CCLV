define [
  'cs!App'
  'cs!lib/controller/LayoutController'
  'cs!sysmodules/files/view/RelatedFileView'
],
( App, LayoutController, RelatedFileView) ->

  class FindsiteController extends LayoutController

    RelatedViews:
      fileView: RelatedFileView

    getPointsLatLng:(obj)->
      paths = obj.getPath()
      points = []
      for i in [0..paths.getLength()-1]
        point = paths.getAt(i)
        points.push
          lat: point.lat()
          lng: point.lng()
        points

    createPolygon: (polygon)=>
      model = @createNewModel().set
        type: "polygon"
        points: @getPointsLatLng polygon
      App.Findsites.create model,
        wait:true

    createPolyline: (polyline)->
      model = @createNewModel().set
        type: "polyline"
        points: @getPointsLatLng polyline
      App.Findsites.create model,
        wait:true

    createCircle: (circle)->
      center = circle.getCenter()
      model = @createNewModel().set
        type: "circle"
        points: [
          { lat: center.lat(), lng: center.lng() }
          circle.getRadius() # points[1] = radius
        ]
      App.Findsites.create model,
        wait:true

