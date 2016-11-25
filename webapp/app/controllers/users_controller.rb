class UsersController < ApplicationController
  # before_filter :authenticate_user!


  def show
    @user = User.find_by_id(params[:id])
    @likes = Like.all
  end

  def edit
  end

  def index
    @users = User.all
    @users.each do |user|
      @user = user
    end
    @sorted_users = User.all.shuffle
    @services = []
  end

  def destroy
  end


  # def correct_user
  #   @user = User.find_by_id(params[:id])
  #   redirect_to(root_path) unless current_user?(@user)
  # end

end
