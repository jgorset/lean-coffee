angular.module "lean-coffee"
  .factory "Topic", ($resource) ->
    $resource window.location.pathname + "/topics/:id",
      { id: '@id', socket_id: -> window.pusherSocketId },
      {
        update: { method: 'PUT' }
        vote: { url: window.location.pathname + '/topics/:id/vote', method: 'POST' }
        remove_vote: { url: window.location.pathname + '/topics/:id/remove_vote', method: 'POST' }
      }
