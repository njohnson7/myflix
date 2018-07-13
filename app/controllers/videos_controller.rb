# app/controllers/videos_controller.rb

class VideosController < ApplicationController
  before_action :require_user

  def show
    @video = VideoDecorator.decorate(Video.find params[:id])
  end

  def search
    @videos = Video.search_by_title params[:search_term]
  end
end
