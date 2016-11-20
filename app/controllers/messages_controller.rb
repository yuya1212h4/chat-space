class MessagesController < ApplicationController
  def new
    @message = Message.new
    @messages = Message.all
  end

  def create
    message = current_user.messages.new(message_params)
    if message.present?
      message.save
        redirect_to new_group_message_path(params[:group_id]), notice: "メッセージの投稿が完了しました。"
      else
        redirect_to new_group_message_path(params[:group_id]), notice: "メッセージの送信に失敗しました。"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id])
  end
end
