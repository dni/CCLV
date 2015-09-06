define [
  'cs!App'
  'marionette'
  'cs!./MapItemView'
], (App, Marionette, MapItemView) ->

  class ExtendedMapListView extends Marionette.CollectionView
    childView: MapItemView
