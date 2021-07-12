class MessagesController < ApplicationController
  
  before_action :load_entities

  def create
    @message = Message.create user: current_user,
                                       room: @room,
                                       body: params.dig(:message, :body)
if @message.save
#ActionCable.server.broadcast "comments_channel", render(partial: 'comments/comment', object: @comment)
  redirect_to room_path(@room)
    else
      flash.now[:danger] = "error"
        redirect_to :back
  end
  end

  protected

  def load_entities
    @room = Room.find params.dig(:message, :room_id)
  end
end