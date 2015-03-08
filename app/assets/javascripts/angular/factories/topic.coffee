angular.module "lean-coffee"
  .factory "Topic", ($resource) ->
    $resource("/topics/:id", { id: '@id', socket_id: -> window.pusherSocketId }, { update: { method: 'PUT' }})
