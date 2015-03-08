class TopicsController < ApplicationController
  def index
    @topics = Topic.all

    respond_to do |format|
      format.html
      format.json { render 'index' }
    end
  end

  def create
    @topic = Topic.new topic_params

    respond_to do |format|
      if @topic.save
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

    @topic.votes = params[:votes]

    respond_to do |format|
      if @topic.save
        format.html { redirect_to topics_path }
        format.json { render 'show', status: :created }
      else
        format.html { redirect_to :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
