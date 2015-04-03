class TopicsController < ApplicationController
  def index
    @topics = Topic.all

    respond_to do |format|
      format.html
      format.json { render 'index' }
    end
  end

  def vote
    @topic = Topic.find params[:id]
    @topic.increment :votes
    respond_to do |format|
      if @topic.save 
        push_updated_topic @topic

        format.html { redirect_to topics_path }
        format.json { render 'show', status: :created }
      else
        format.html { redirect_to :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_vote
    @topic = Topic.find params[:id]
    @topic.decrement :votes 
    respond_to do |format|
      if @topic.save
        push_updated_topic @topic

        format.html { redirect_to topics_path }
        format.json { render 'show', status: :created }
      else
        format.html { redirect_to :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @topic = Topic.find params[:id]

    respond_to do |format|
      format.html
      format.json { render 'show' }
    end
  end

  def create
    @topic = Topic.new topic_params

    respond_to do |format|
      if @topic.save
        push_new_topic @topic

        format.html { redirect_to topics_path }
        format.json { render 'show', status: :created }
      else
        format.html { redirect_to :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @topic = Topic.find params[:id]

    @topic.attributes = topic_params

    respond_to do |format|
      if @topic.save
        push_updated_topic @topic

        format.html { redirect_to topics_path }
        format.json { render 'show', status: :created }
      else
        format.html { redirect_to :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @topic = Topic.find params[:id]
    respond_to do |format|
      if @topic.destroy
        push_updated_topic @topic
        
        format.html { redirect_to :index }
        format.json { head :no_content }
      end
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :status, :votes)
  end

  def push_new_topic topic
    Pusher.trigger 'channel', 'new_topic', topic, socket_id: params[:socket_id]
  end

  def push_updated_topic topic
    Pusher.trigger 'channel', 'updated_topic', topic, socket_id: params[:socket_id]
  end
end
