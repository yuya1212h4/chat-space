class GroupsController < ApplicationController
  
  def index
  end

  def new
    @group = Group.new
    @group.users.build
  end

  def create
    group = Group.create(group_params)
    redirect_to root_path
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(group_params)
    redirect_to new_group_message_path(params[:id])
  end

  private
  def group_params
    params.require(:group).permit(:name, {user_ids: []})
  end

  def users_params
    params.require(:users).permit(user_id: [])
  end
end
