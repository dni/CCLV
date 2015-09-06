define [
  'marionette'
  'tpl!../templates/applayout.html'
], (Marionette, Template) ->
  class LayoutView extends Marionette.LayoutView

    id: "app"
    template: Template

    regions:
      navigationRegion:"#navbar"
      mapRegion:"#map"
      contentRegion:"#content"
      detailRegion:"#details"
      infoRegion:"#info"
      overlayRegion: "#overlay"
      listTopRegion: "#controls"
