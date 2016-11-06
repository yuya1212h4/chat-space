class GroupsController < ApplicationController
  def index
    @group = Group.new
    @message = Message.new
    # @messages = Message.group(:message_id)
    @messages = Message.all
    # binding.pry
  end
end
