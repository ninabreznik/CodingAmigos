class ProjectsController < ApplicationController

  def new
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: 201, acl: :public_read)
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @user = current_user
      if @project.save
        auto_create_user!(@project)
        # if params[:images]
        #   #===== The magic is here ;)
        #   params[:images].each { |image|
        #     @project.pictures.create(image: image)
        #   }
        # end
      redirect_to user_path(@user)
      else
      redirect_to new_project_path
      end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
      @project = Project.find(params[:id])
      @user = current_user
    if @project.update_attributes(project_params)
      redirect_to user_path(@user)
    else
      redirect_to edit_project_path
    end
    @project.save
  end

  def index
    @projects = Project.all
    @likes = Like.all
    @projects = []
    User.all.each do |user|
      @user = user
    end
    @sorted_users = User.all.sort_by{|updated| @user.updated_by}
    projects_old = -1
    i=0
    while projects_old < @projects.count
      projects_old = @projects.count
      @sorted_users.reverse.each do |user|
        if user.projects[i]
          @projects << user.projects[i]
        end
      end
      i+=1
    end
  end

  def show
    @project = Project.find_by_id(params[:id])
    if @project.present?
      @project_title = @project.title
      @project_description = @project.description
      @project_email = @project.email
    end
  end


  def destroy
     @project = Project.find_by_id(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(
      :title,
      :live_demo,
      :user_id,
      :picture,
      :email,
      :description,
      :repository,
      :category
    )
  end

  def auto_create_user!(project)
    if user_signed_in?
      project.user_id = current_user.id
    else
      user = User.find_by_email(project.email)
      if user
        project.user_id = user.id
      else
        pass = SecureRandom.hex[0..7]
        user = User.create!(
                 email: project.email,
                 password: pass,
                 password_confirmation: pass
               )
        project.user_id = user.id
        user.projects << project
        UserMailer.welcome_email(user, pass).deliver
      end
    end
    project.save
  end
end
