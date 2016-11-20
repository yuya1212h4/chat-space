class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    if group.save
      redirect_to root_path, notice: "グループの作成が完了しました。"
    else
      redirect_to root_path, notice: "グループの作成に失敗しました。"
    end
  end

  def edit
    @group = info_group
  end

  def update
    info_group.update(group_params)
    redirect_to new_group_message_path(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name, {user_ids: []} )
  end

  def info_group
    Group.find(params[:id])
  end

end
