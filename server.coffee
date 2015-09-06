App = require "./app"
config = require "./configuration.json"

port = 2010
server = App config, ->
  console.log "Welcome to CCLV powered by Oophaga CMS, quack! server runs on port #{port}"

