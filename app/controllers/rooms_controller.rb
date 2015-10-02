class RoomsController < ApplicationController
  before_action :set_room, only: [:edit, :update, :destroy, :archives]

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find_by!(slug: params[:slug])
    @topics = @room.topics.all
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        push_new_room @room
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @room.update(room_params)
        push_updated_room @room
        format.html { redirect_to root_url, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @room.destroy
    respond_to do |format|
      push_delete_room @room
      format.html { redirect_to root_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def archives
    topics = @room.topics.order('created_at DESC')
    topics.where!('title ilike ?', "%#{params[:q]}%") if params[:q]
    @grouped_topics = topics.group_by{ |t| t.created_at.to_date }
  end

  def push_new_room room
    Pusher.trigger 'rooms', 'new_room', room, socket_id: params[:socket_id]
  end

  def push_updated_room room
    Pusher.trigger 'rooms', 'updated_room', room, socket_id: params[:socket_id]
  end

  def push_delete_room room
    Pusher.trigger 'rooms', 'deleted_room', room, socket_id: params[:socket_id]
  end

  private
    def set_room
      @room = Room.find_by! slug: params[:slug]
    end

    def room_params
      params.require(:room).permit(:name, :description, :slug)
    end
end
