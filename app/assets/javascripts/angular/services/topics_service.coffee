angular.module "lean-coffee"
  .service "topicsService", ($resource, Topic) ->
    @list = []

    @load = =>
      @list = Topic.query => @sort()

    @create = (attributes) =>
      topic = new Topic(attributes)
      topic.$save()
        .then (topic) =>
          @list.push topic

    @voteFor = (topic) =>
      topic.votes += 1
      topic.$update()

    @destroy = (topic) =>
      topic.$delete()

      index = _.indexOf(@list, topic)
      @list.splice(index, 1)

    @sort = =>
      @list.sort (a, b) => b.votes - a.votes

    @load()

    this
