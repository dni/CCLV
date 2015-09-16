define [
  'cs!lib/controller/LayoutController'
  'cs!sysmodules/files/view/RelatedFileView'
],
( LayoutController, RelatedFileView) ->

  class FindsController extends LayoutController
    RelatedViews:
      fileView: RelatedFileView
