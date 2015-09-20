define [
    'cs!lib/Module'
    'cs!App'
    'i18n!./nls/language.js'
    'cs!./controller/FindsiteController'
    "text!./configuration.json"
], (Module, App, i18n, Controller, Config) ->

  module = new Module
    Controller: Controller
    Config:Config
    i18n:i18n

  App.google.event.addListener App.drawingManager, 'circlecomplete', (circle)->
    module.Controller.createCircle circle
    circle.setMap null

  App.google.event.addListener App.drawingManager, 'polygoncomplete', (polygon)->
    module.Controller.createPolygon polygon
    polygon.setMap null

  App.google.event.addListener App.drawingManager, 'polylinecomplete', (polyline)->
    module.Controller.createPolygon polyline
    polyline.setMap null

  module
