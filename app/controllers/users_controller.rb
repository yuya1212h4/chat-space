class UsersController < ApplicationController

  def search
    @users = User.where('name LIKE(?)',"%#{search_params[:name]}%")
    respond_to do |format|
      format.json
    end
  end

  private

  def search_params
    params.permit(:name)
  end
end
