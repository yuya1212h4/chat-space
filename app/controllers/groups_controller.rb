class GroupsController < ApplicationController
  def index
    # @group = Group.new
    @message = Message.new
    # # @messages = Message.group(:message_id)
    @messages = Message.all
    # # binding.pry
  end

  def edit
    @group = Group.find(params[:id])
  end

  def new
    # binding.pry
    # @group = Group.find(params[:group_id])
    # @message = Message.new

    @group = Group.new
    @group.users.build
  end

  def create
    binding.pry
    # Group.create(group_params)
    # group = Group.last.id
    Group.create(group_params)
    # Group.create(users_params)
    # params.require(:groups).where()
    binding.pry
    redirect_to root_path
  end

  private
  def group_params
    # params.require(:group).permit(:name, :user_id).merge(group_id: Group.last.id, user_id: current_user.id)
    params.require(:group).permit(:name, users_attributes: [:user_id])
    # params.require(:post).permit(:user_id)
  end
  #
  # def users_params
  #   params.require(:users).permit(:user_id)
  # end
end
