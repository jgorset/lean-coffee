angular.module "lean-coffee"
  .filter 'debug', ($sce) ->
    (input) ->
      console.log(JSON.stringify(input))
      input
