define [
  'cs!App'
  'cs!Oophaga'
  'i18n!lib/nls/language'
  'cs!Utils'
  'cs!Router'
  'marionette'
  'tpl!lib/templates/show.html'
  'cs!modules/files/view/RelatedFileView'
], (App, Oophaga, i18n, Utils, Router, Marionette, Template, RelatedFileView) ->

  class ShowView extends Marionette.LayoutView
    template: Template
    regions:
      relatedRegion: "#relations"

    initialize:(args)->
      @model = args.model
      @relatedView = args.relatedView
      @on "render", @afterRender, @

    templateHelpers: ->
      vhs: _.extend Utils.Viewhelpers, Config: @options.Config, t: attributes: _.extend @options.i18n.attributes, i18n.attributes
