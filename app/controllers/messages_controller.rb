class MessagesController < ApplicationController
  before_action :set_group

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to new_group_message_path(@group), notice: "メッセージの投稿が完了しました。" }
        format.json { render json: { name: @message.user.name, created_at: @message.created_at, body: @message.body } }
      end
    else
      flash.now[:alert] = "メッセージの送信に失敗しました。"
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
