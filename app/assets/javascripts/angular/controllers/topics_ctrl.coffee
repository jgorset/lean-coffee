angular.module "lean-coffee"
  .controller "TopicsCtrl", ($scope, topicsService) ->
    $scope.service = topicsService

    @create = =>
      if @title.length
        topicsService.create title: @title
        @title = ""

    @update = (topic) =>
      if topic.title.length
        topic.$update()

    @delete = (topic) =>
      if confirm('Are you sure you want to delete this?')
        topicsService.delete(topic)

    @times = (n) =>
      new Array(n)


    $scope.topicOverLaneCallback = (e) =>
      element = angular.element(e.target)
      topicsService.targetLane = element.data('lane')
      element.addClass('hovering')

    $scope.topicDroppedOutsideLaneCallback = (e) =>
      alert 'test'

    $scope.topicOutOfLaneCallback = (e) =>
      angular.element(e.target).removeClass('hovering')

    $scope.topicDroppedInLaneCallback= (e) =>
      angular.element(e.target).removeClass('hovering')

    this
