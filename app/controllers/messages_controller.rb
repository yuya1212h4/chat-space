class MessagesController < ApplicationController
  def new
    @message = Message.new
    @messages = Message.all
  end

  def create
    Message.create(message_params)
    redirect_to new_group_message_path(params[:group_id])
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
