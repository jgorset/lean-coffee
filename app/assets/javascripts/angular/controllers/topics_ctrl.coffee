angular.module "lean-coffee"
  .controller "TopicsCtrl", ($scope, topicsService) ->
    $scope.service = topicsService

    @create = =>
      if @title.length
        topicsService.create title: @title
        @title = ""

    @times = (n) =>
      new Array(n)

    $scope.topicOverLaneCallback = (e) =>
      element = angular.element(e.target)

      $scope.targetLane = element.data('lane')
      element.addClass('hovering')

    $scope.topicOutOfLaneCallback = (e) =>
      angular.element(e.target).removeClass('hovering')

    $scope.topicDroppedInLaneCallback= (e) =>
      angular.element(e.target).removeClass('hovering')

    this
