class MessagesController < ApplicationController
  def create
    Message.create(message_params)
    redirect_to groups_path
  end


  private
  def message_params
    params.require(:message).permit(:body)
  end
end
