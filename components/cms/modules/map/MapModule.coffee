define [
  'cs!App'
  'cs!lib/Module'
  'cs!./view/MapView'
  'i18n!./nls/language'
  'text!./configuration.json'
  'less!./style/map.less'
],
( App, Module, MapView, i18n, Config)->

  # overlay view
  App.view.mapRegion.show new MapView

  new Module
    Config: Config
    i18n: i18n
    disableRoutes: true

