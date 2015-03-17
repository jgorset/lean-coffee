angular.module "lean-coffee"
  .controller "TopicCtrl", ($scope, topicsService) ->
    @topic = $scope.topic

    @vote = =>
      topicsService.voteFor(@topic)

    @remove_vote = =>
      if $scope.topic.votes >= 1
        topicsService.removeVoteFor(@topic)

    @remove_topic = =>
      if confirm('Are you sure you want to delete this?')
        topicsService.destroy(@topic)

    $scope.topicStoppedDraggingCallback = (e) =>
      topicsService.move @topic, topicsService.targetLane

    this
