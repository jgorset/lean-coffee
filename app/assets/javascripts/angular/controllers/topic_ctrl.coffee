angular.module "lean-coffee"
  .controller "TopicCtrl", ($scope, topicsService) ->

    @vote = =>
      topicsService.voteFor($scope.topic)

    this
