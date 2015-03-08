angular.module "lean-coffee"
  .controller "LaneCtrl", ($scope) ->
    $scope.dragOver = (e) =>
      angular.element(e.target).addClass('hovering')

    $scope.dragOut = (e) =>
      angular.element(e.target).removeClass('hovering')

    this
