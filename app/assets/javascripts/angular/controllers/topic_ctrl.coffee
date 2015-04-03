angular.module "lean-coffee"
  .controller "TopicCtrl", ($scope, topicsService) ->
    @topic = $scope.topic
    @edit_topic = false

    @vote = =>
      topicsService.voteFor(@topic)

    @edit = =>
      @edit_topic = !@edit_topic

    @remove_vote = =>
      topicsService.removeVoteFor(@topic)

    $scope.topicStoppedDraggingCallback = (e) =>
      topicsService.move @topic, topicsService.targetLane

    this
