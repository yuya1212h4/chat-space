class MessagesController < ApplicationController

  def new
    @message = Message.new
    @group = Group.find(params[:group_id])

    if params[:last_message_id].present?
      @messages = @group.messages.where('id > ?', params[:last_message_id])
    elsif
      @messages = @group.messages
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
