class MessagesController < ApplicationController

  def new
    @message = Message.new
    groupid = params[:groupid_json] || params[:group_id]
    @group = Group.find(groupid)

    respond_to do |format|
      format.html
      format.json do
        @messages = @group.messages.where('id > ?', params[:last_message_id])
      end
    end
  end

  def create
    @message = current_user.messages.new(message_params)
    @group = Group.find(params[:group_id])
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
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end
end
