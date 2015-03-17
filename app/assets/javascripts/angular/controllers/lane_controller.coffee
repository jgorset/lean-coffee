angular.module "lean-coffee"
  .controller "LaneCtrl", ($scope, $element, topicsService) ->

    @lanes = ['To talk about', 'Talking about', 'Talked about']

    this
