angular.module "lean-coffee"
  .service "topicsService", ($rootScope, $resource, $pusher, Topic) ->
    @topics = Topic.query =>
      @sort()

    @targetLane = 0

    pusher = $pusher(pusherClient)

    channel = pusher.subscribe 'channel'

    channel.bind 'new_topic', (topic) =>
      @addTopic new Topic(topic)

    channel.bind 'updated_topic', (topic) =>
      @updateTopic new Topic(topic)

    @create = (attributes) =>
      topic = new Topic(attributes)
      topic.$save()
        .then (topic) =>
          @addTopic(topic)

    @addTopic = (topic) =>
      @topics.unshift topic

    @updateTopic = (topic) =>
      old_topic = _.find @topics, (t) =>
        t.id == topic.id
      index = _.indexOf(@topics, old_topic)
      @topics[index] = topic

    @voteFor = (topic) =>
      topic.$vote()

    @removeVoteFor = (topic) =>
      topic.$remove_vote()

    @move = (topic, lane) =>
      topic.status = lane
      topic.$update()


    @delete = (topic) =>
      topic.$delete()
        .then (topic) =>
          index = _.indexOf(@topics, topic)
          @topics.splice(index, 1)

    @sort = =>
      @topics.sort (a, b) => b.votes - a.votes

    this
