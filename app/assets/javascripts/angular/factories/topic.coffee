angular.module "lean-coffee"
  .factory "Topic", ($resource) ->
    $resource("/topics/:id", 
      { id: '@id', socket_id: -> window.pusherSocketId }, 
      { 
        update: { method: 'PUT' },
        vote: { url: '/topics/:id/vote', method: 'PUT' }
        remove_vote: { url: '/topics/:id/remove_vote', method: 'PUT' }
      })
