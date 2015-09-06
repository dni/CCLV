define [
  'cs!App'
  'cs!lib/view/MapItemView'
], (App, MapItemView ) ->

  class ExtendedMapItemView extends MapItemView

    getIcon: ->
      strokeColor: "blue"
      scale: 5


