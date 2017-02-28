class MessagesController < ApplicationController

  def new
    @message = Message.new
    @group = Group.find(params[:group_id])

    message_ids = @group.messages.pluck(:id)

    current_message_ids = params[:message_ids] || []

    @messages = @group.messages.reject do |message|
      current_message_ids.include? message.id.to_s
    end

    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to new_group_message_path(params[:group_id]), notice: 'メッセージの投稿が完了しました。' }
        format.json
      end
    else
      flash[:alert] = 'メッセージの送信に失敗しました。'
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
