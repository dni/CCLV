define [
    'cs!lib/Module'
    'text!./configuration.json'
    'i18n!./nls/language.js'
], ( Module, Config, i18n ) ->

  new Module
    Config: Config
    i18n:i18n
