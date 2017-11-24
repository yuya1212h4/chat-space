class UsersController < ApplicationController
  def search
    @users = User.not_user(current_user).incremental_search(params[:name])
    respond_to do |format|
      format.json
    end
  end
end
