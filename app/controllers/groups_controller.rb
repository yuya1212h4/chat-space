class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index
    render 'sidebar/_sidebar_top'
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to new_group_message_path(@group), notice: 'グループの作成が完了しました。'
    else
      flash.now[:alert] = 'グループの作成に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to new_group_message_path(params[:id]), notice: 'グループの更新が完了しました。'
    else
      redirect_to :back, alert: 'グループの更新に失敗しました。'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [] )
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
