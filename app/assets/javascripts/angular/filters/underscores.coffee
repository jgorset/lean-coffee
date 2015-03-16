angular.module "lean-coffee"
  .filter 'underscores', ($sce) ->
    (str) ->
      str.replace(/\s+/g, '_')