class GroupsController < ApplicationController
  def index
    @group = Group.new
    @message = Message.new
  end
end
