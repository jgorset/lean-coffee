angular.module "lean-coffee"
  .controller "LaneCtrl", ($scope, topicsService) ->

    $scope.onOver = (e) =>
      angular.element(e.target).addClass('hovering')

    $scope.onOut = (e) =>
      angular.element(e.target).removeClass('hovering')

    $scope.onDrop = (e) =>
      angular.element(e.target).removeClass('hovering')

    this
