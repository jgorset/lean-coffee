angular.module "lean-coffee"
  .controller "TopicCtrl", ($scope, topicsService) ->
    @topic = $scope.topic

    @vote = =>
      topicsService.voteFor(@topic)

    @remove_vote = =>
      if $scope.topic.votes >= 1
        topicsService.removeVoteFor(@topic)

    $scope.topicStoppedDraggingCallback = (e) =>
      topicsService.move @topic, $scope.targetLane

    this
