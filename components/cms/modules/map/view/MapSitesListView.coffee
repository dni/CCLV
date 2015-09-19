define [
  'cs!App'
  'marionette'
  'cs!./MapSitesItemView'
], (App, Marionette, MapItemView) ->

  class MapSitesListView extends Marionette.CollectionView
    childView: MapItemView
