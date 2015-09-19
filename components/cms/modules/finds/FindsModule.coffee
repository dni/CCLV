define [
    'cs!lib/Module'
    'i18n!./nls/language.js'
    "text!./configuration.json"
    'cs!./controller/FindsController'
], (Module, i18n, Config, Controller) ->
  new Module
    Controller: Controller
    Config:Config
    i18n:i18n
