angular.module "lean-coffee"
  .controller "TopicsCtrl", ($scope, topicsService) ->
    @service = topicsService

    @create = =>
      if @title.length
        topicsService.create title: @title
        @title = ""

    @times = (n) =>
      new Array(n)

    this
