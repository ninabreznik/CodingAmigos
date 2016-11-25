class LikesController < ApplicationController

  def create
    @project = Project.find_by_id(params[:like][:likee_id])
    current_user.like!(@project)
    @user = current_user
    UserMailer.project_like(@project.user, @project).deliver
    redirect_to :back
  end

  def destroy
    Like.find(params[:id]).destroy
    redirect_to :back
  end


end