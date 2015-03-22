define [
  'cs!App'
  'cs!Oophaga'
  'cs!Router'
  'jquery'
  'cs!../view/BrowseView'
  'cs!../view/ShowFileView'
  'cs!../view/EditFileView'
  'cs!../view/PreviewView'
  'jquery.form'
], ( App, Oophaga, Router, $, BrowseView, ShowFileView, EditFileView, PreviewView) ->

  class FileController extends Oophaga.Controller.LayoutController

    RelatedViews:
      preview: PreviewView

    filterFunction: (file)->
      !file.getValue('parent')?

    routes:
      "showfile/:id": "show"
      "editfile/:id": "edit"
      "uploadFile": "upload"

    show: (id) ->
      App.overlayRegion.show new ShowFileView
        model: App.Files.findWhere _id: id

    edit: (id) ->
      App.overlayRegion.show new EditFileView
        model: App.Files.findWhere _id: id

    upload: ->

      $("#upload")
        .trigger "click"
        .ajaxForm (response) -> return
        .submit()

