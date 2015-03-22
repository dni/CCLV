mongoose = require 'mongoose'
_ = require "underscore"
Schema = mongoose.Schema
collections = {}

module.exports = (dbTable)->
  unless collections[dbTable]?
    schema = new Schema
      sortorder: Number
      fieldorder: Array
      published: Boolean
      user: String
      crdate: Date
      date: Date
      name: String
      fields: Object

    schema.methods.setFieldValue = (field, value)->
      if _.isObject field
        for key, value of field
          @fields[key]?.value = value
      else
        @fields[field]?.value = value

    schema.methods.getFieldValue = (field)->
      @fields[field].value

    schema.pre 'save', (next)->
      @date = Date.now
      next()

    collections[dbTable] = mongoose.model dbTable, schema
  collections[dbTable]
