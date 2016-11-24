class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    if group.save
      redirect_to new_group_message_path(group.id), notice: "グループの作成が完了しました。"
    else
      session[:name] = params[:group][:name]
      redirect_to :back, alert: "グループの作成に失敗しました。"
    end
  end

  def edit
    @group = set_group
  end

  def update
    set_group.update(group_params)
    redirect_to new_group_message_path(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end

  def set_group
    Group.find(params[:id])
  end

end
