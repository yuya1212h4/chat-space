class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index
    render 'layouts/_sidebar'
  end

  def new
    @group = Group.new
    @users = User.not_user(current_user)
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to new_group_message_path(@group), notice: 'グループの作成が完了しました。'
    else
      flash[:alert] = 'グループの作成に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to new_group_message_path(@group), notice: 'グループの更新が完了しました。'
    else
      flash.now[:alert] = 'グループの更新に失敗しました。'
      render :edit
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
