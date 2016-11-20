class MessagesController < ApplicationController
  def new
    @message = Message.new
    @messages = Message.all
    # @messages = Group.messages.all
  end

  def create
    # binding.pry
    message = Message.new(message_params)
    if message.present?
      message.save
        redirect_to new_group_message_path(params[:group_id]), notice: "メッセージの投稿が完了しました。"
      else
        redirect_to new_group_message_path(params[:group_id]), notice: "メッセージの送信に失敗しました。"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
  # def message_params
  #   params.permit(:group_id, {message: :body})
  # end

  # def group_params
  #   params.permit(:group_id)
  # end
end
