angular.module("lean-coffee", ['ngAnimate', 'ngResource', 'ngDragDrop', 'pusher-angular'])
  .config ($httpProvider) ->
    authToken = $("meta[name=\"csrf-token\"]").attr("content")
    $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
    $httpProvider.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest"
    $httpProvider.defaults.headers.common["Accept"] = "application/json"

$(document).on 'ready page:load', ->
  angular.bootstrap document.body, ['lean-coffee']
