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
    # binding.pry
  end

  def create
    # Group.create(group_params)
    # group = Group.last.id
    # binding.pry
    group = Group.create(group_params)
    # binding.pry

    # binding.pry
    # group_ids = Group.last.id
    # users_params.each do |n|
    #   # Group.create(gorup_id: )
    # end
    #
    binding.pry
    # Group.create(users_params)
    # params.require(:groups).where()
    redirect_to root_path
  end

  private
  def group_params
    # params.require(:group).permit(:name, :user_id).merge(group_id: Group.last.id, user_id: current_user.id)
    params.require(:group).permit(:name, {user_ids: []})
    # params.require(:group).permit(:name)
    # params.require(:post).permit(:user_id)
  end

  def users_params
    # params.require(:users)[:user_id]
    params.require(:users).permit(user_id: [])
  end
end
