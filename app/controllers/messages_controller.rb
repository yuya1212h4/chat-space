class MessagesController < ApplicationController
  before_action :set_message
  before_action :set_on_group

  def new
  end

  def create
    message = current_user.messages.new(message_params)
    if message.save
      flash.now[:notice] = "メッセージの投稿が完了しました。"
      render 'new'
    else
      flash.now[:alert] = "メッセージの送信に失敗しました。"
      render template: 'messages/new'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id])
  end

  def set_message
    @message = Message.new
  end

  def set_on_group
    @group = Group.find(params[:group_id])
  end
end
