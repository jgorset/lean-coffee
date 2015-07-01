angular.module "lean-coffee"
  .factory "Topic", ($resource) ->
    $resource window.location.pathname + "/topics/:id",
      { id: '@id' },
      {
        update: { method: 'PUT' }
        vote: { url: window.location.pathname + '/topics/:id/vote', method: 'POST' }
        remove_vote: { url: window.location.pathname + '/topics/:id/remove_vote', method: 'POST' }
        archive: { url: window.location.pathname + '/topics/:id/archive', method: 'PUT' }
        archiveAll: { isArray: true, url: window.location.pathname + '/topics/archive', method: 'PUT' }
      }
