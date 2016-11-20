class MessagesController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @message = @group.messages.new
    @messages = @group.messages
  end

  def create
    message = current_user.messages.new(message_params)
    if message.save
      redirect_to new_group_message_path(params[:group_id]), notice: "メッセージの投稿が完了しました。"
    else
      redirect_to new_group_message_path(params[:group_id]), alert: "メッセージの送信に失敗しました。"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id])
  end
end
