class MessagesController < ApplicationController
  before_action :set_group

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to new_group_message_path(@group), notice: "メッセージの投稿が完了しました。"
    else
      flash.now[:alert] = "メッセージの送信に失敗しました。"
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
