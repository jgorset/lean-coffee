angular.module "lean-coffee"
  .controller "TopicsCtrl", ($scope, topicsService) ->
    @service = topicsService

    @create= =>
      if $scope.title.length
        topicsService.create title: $scope.title
        $scope.title = ""

    this
