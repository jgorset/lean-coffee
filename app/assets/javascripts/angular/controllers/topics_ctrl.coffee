angular.module "lean-coffee"
  .controller "TopicsCtrl", ($scope, topicsService) ->
    $scope.service = topicsService

    # These three watches should probably be in their LaneCtrls, but I
    # don't know how to pass them the names of their collections.

    $scope.$watchCollection 'service.to_talk_about', (newValue, oldValue) =>
      newModels = _.difference(newValue, oldValue)

      for newModel in newModels
        topicsService.move(newModel, 'to_talk_about')

    $scope.$watchCollection 'service.talking_about', (newValue, oldValue) =>
      newModels = _.difference(newValue, oldValue)

      for newModel in newModels
        topicsService.move(newModel, 'talking_about')

    $scope.$watchCollection 'service.talked_about', (newValue, oldValue) =>
      newModels = _.difference(newValue, oldValue)

      for newModel in newModels
        topicsService.move(newModel, 'talked_about')

    @create = =>
      if @title.length
        topicsService.create title: @title
        @title = ""

    @times = (n) =>
      new Array(n)

    $scope.onStart = (e) =>

    $scope.onStop = (e) =>

    $scope.onDrop = (e) =>
      topicsService.update()

    this
