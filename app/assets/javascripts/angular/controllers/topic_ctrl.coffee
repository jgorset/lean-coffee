angular.module "lean-coffee"
  .controller "TopicCtrl", ($scope, topicsService) ->
    @topic = $scope.topic

    @vote = =>
      topicsService.voteFor(@topic)

    this
