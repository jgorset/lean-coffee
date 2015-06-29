angular.module "lean-coffee"
  .controller "TopicsCtrl", ($scope, topicsService) ->
    $scope.service = topicsService

    @create = =>
      if @title.length
        topicsService.create title: @title
        @title = ""

    @delete = (topic) =>
      if confirm('Are you sure you want to delete this?')
        topicsService.delete(topic)

    @archive = (topic) =>
      if confirm('Are you sure you want to archive this?')
        topicsService.archive(topic)

    @archiveAll = =>
      if confirm('Are you sure you want to archive all discussed topics?')
        topicsService.archiveAll()

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
