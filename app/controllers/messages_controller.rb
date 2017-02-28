class MessagesController < ApplicationController

  def new
    @message = Message.new
    @group = Group.find(params[:group_id])

    db_message_ids = []
    @group.messages.each do |message|
      db_message_ids << message.id.to_s
    end

    current_message_ids = params[:message_ids]
    current_message_ids = db_message_ids if current_message_ids.nil?

    add_message_ids = db_message_ids - current_message_ids
    add_message_ids.each do |id|
      @messages.push( Message.find(id) )
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
