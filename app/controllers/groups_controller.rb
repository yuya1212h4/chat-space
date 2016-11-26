class GroupsController < ApplicationController
  before_action :set_group

  def index
  end

  def new
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
  end

  def update
    group = set_group.update(group_params)
    if group
      redirect_to new_group_message_path(params[:id]), notice: "グループの更新が完了しました。"
    else
      session[:name] = params[:group][:name]
      redirect_to :back, alert: "グループの更新に失敗しました。"
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end

  def set_group
    params[:id].nil? ? @group = Group.new : @group = Group.find(params[:id])
  end
end
