class MessagesController < ApplicationController
  def new
    @message = Message.new
    @messages = Message.all
  end

  def create
    message = Message.new(body: message_params[:body], user_id: current_user.id, group_id: params[:group_id])
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
end
