class TopicsController < ApplicationController

  rescue_from PG::CheckViolation, with: :constrain_above_zero

  before_action :get_room

  def index
    @topics = @room.topics.where(archived: false)
  end

  def vote
    @topic = @room.topics.find params[:id]
    respond_to do |format|
      if @topic.increment! :votes
        push_updated_topic @topic
        format.html { redirect_to @room }
        format.json { render 'show', status: :ok }
      end
    end
  end

  def remove_vote
    @topic = @room.topics.find params[:id]
    respond_to do |format|
      if @topic.decrement! :votes
        push_updated_topic @topic
        format.html { redirect_to @room }
        format.json { render 'show', status: :ok }
      end
    end
  end

  def archive
    @topic = @room.topics.find params[:id]
    respond_to do |format|
      if @topic.update archived: true
        push_updated_topic @topic
        format.html { redirect_to @room }
        format.json { render 'show', status: :ok }
      end
    end
  end

  def archive_all
    @room.topics.where(status: :talked_about).each do |topic|
      topic.update archived: true
      push_updated_topic topic
    end
    @topics = @room.topics.where(archived: false)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render 'index', status: :ok }
    end
  end

  def show
    @topic = @room.topics.find params[:id]

    respond_to do |format|
      format.html
      format.json { render 'show' }
    end
  end

  def create
    @topic = @room.topics.new topic_params

    respond_to do |format|
      if @topic.save
        push_new_topic @topic

        format.html { redirect_to @room }
        format.json { render 'show', status: :created }
      else
        format.html { redirect_to :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @topic = @room.topics.find params[:id]

    @topic.attributes = topic_params

    respond_to do |format|
      if @topic.save
        push_updated_topic @topic

        format.html { redirect_to @room }
        format.json { render 'show', status: :ok }
      else
        format.html { redirect_to :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @topic = @room.topics.find params[:id]
    respond_to do |format|
      if @topic.destroy
        push_updated_topic @topic

        format.html { redirect_to :index }
        format.json { head :no_content }
      end
    end
  end

  private

  def get_room
    @room = Room.find_by slug: params[:slug]
  end

  def constrain_above_zero
    @topic.errors.add(:votes, "cannot be less than 0")
    respond_to do |format|
      format.html { redirect_to :new }
      format.json { render json: @topic.errors, status: :unprocessable_entity }
    end
  end

  def topic_params
    params.require(:topic).permit(:title, :status, :votes)
  end

  def push_new_topic topic
    Pusher.trigger @room.slug, 'new_topic', topic, socket_id: params[:socket_id]
  end

  def push_updated_topic topic
    Pusher.trigger @room.slug, 'updated_topic', topic, socket_id: params[:socket_id]
  end
end
