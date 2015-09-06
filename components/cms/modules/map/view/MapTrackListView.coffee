define [
  'cs!App'
  'marionette'
  'cs!./MapTrackItemView'
], (App, Marionette, MapItemView) ->

  class MapTrackListView extends Marionette.CollectionView
    childView: MapItemView
