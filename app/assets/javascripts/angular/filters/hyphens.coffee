angular.module "lean-coffee"
  .filter 'hyphens', ($sce) ->
    (str) ->
      str.replace(/\s+/g, '-')