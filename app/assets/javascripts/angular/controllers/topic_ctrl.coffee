angular.module "lean-coffee"
  .controller "TopicCtrl", ($scope, topicsService) ->
    @topic = $scope.topic

    @vote = =>
      topicsService.voteFor(@topic)

    $scope.topicStoppedDraggingCallback = (e) =>
      topicsService.move @topic, $scope.targetLane

    this
