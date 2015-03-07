angular.module "lean-coffee"
  .service "topicsService", ($resource, Topic) ->
    @list = []

    @load = =>
      @list = Topic.query()

    @create = (attributes) =>
      topic = new Topic(attributes)
      topic.$save()
        .then (topic) =>
          @list.unshift topic

    @destroy = (topic) =>
      topic.$delete()

      index = _.indexOf(@list, topic)
      @list.splice(index, 1)

    @load()

    this
