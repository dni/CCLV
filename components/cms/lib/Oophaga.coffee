define [
  'cs!Utils'
  'cs!lib/controller/Controller'
  'cs!lib/controller/LayoutController'
  'cs!lib/Module'
  'cs!lib/model/Model'
  'cs!lib/model/Collection'
  'cs!lib/view/ListView'
  'cs!lib/view/DetailView'
  'cs!lib/view/EmptyView'
  'cs!lib/view/TopView'
  'cs!lib/view/OverlayView'
  'cs!lib/Regions'
  'cs!lib/Events'
  'cs!lib/Socket'
], ( Utils, Controller, LayoutController, Module, Model, Collection, ListView, DetailView, EmptyView, TopView, OverlayView) ->
  Utils: Utils
  Module: Module
  Controller:
    Controller: Controller
    LayoutController: LayoutController
  Model: Model
  Collection: Collection
  View:
    EmptyView: EmptyView
    TopView: TopView
    ListView: ListView
    DetailView: DetailView
    OverlayView: OverlayView
