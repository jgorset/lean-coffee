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
      topicsService.targetLane = element.data('lane')
      
      console.log topicsService.targetLane
      element.addClass('hovering')

    $scope.topicDroppedOutsideLaneCallback = (e) =>
      alert 'test'

    $scope.topicOutOfLaneCallback = (e) =>
      angular.element(e.target).removeClass('hovering')
      topicsService.targetLane = 0
      console.log topicsService.targetLane

    $scope.topicDroppedInLaneCallback= (e) =>
      angular.element(e.target).removeClass('hovering')

    this
