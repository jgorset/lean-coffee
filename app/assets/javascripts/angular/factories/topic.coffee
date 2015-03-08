angular.module "lean-coffee"
  .factory "Topic", ($resource) ->
    $resource("/topics/:id", { id: '@id' }, { update: { method: 'PUT' }})
