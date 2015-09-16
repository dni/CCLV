App = require "./app"
config = require "./configuration.json"

server = App config, ->
  console.log "Welcome to CCLV powered by Oophaga CMS, quack! server runs on port #{config.port}"

