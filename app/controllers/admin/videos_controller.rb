# app/controllers/admin/videos_controller.rb

class Admin::VideosController < ApplicationController
  before_action :require_user
  before_action :require_admin

  def new
    @video = Video.new
  end

  def create
    @video = Video.create params.require(:video).permit!
    if @video.save
      flash[:success] = "You have successfully added the video '#{@video.title}'"
      redirect_to new_admin_video_path
    else
      flash[:error] = 'You cannot add this video. Please check the errors.'
      render :new
    end
  end

  private

  def require_admin
    if !current_user.admin?
      flash[:error] = 'You are not authorized to do that.'
      redirect_to home_path
    end
  end
end
