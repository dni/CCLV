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

  App.google.event.addListener App.drawingManager, 'polygoncomplete', (polygon)->
    module.Controller.createPolygon polygon

  App.google.event.addListener App.drawingManager, 'polylinecomplete', (polyline)->
    module.Controller.createPolygon polyline

  module
