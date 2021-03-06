# app/controllers/videos_controller.rb

class VideosController < ApplicationController
  before_action :require_user

  def show
    @video = VideoDecorator.decorate(Video.find params[:id])
  end

  def search
    @videos = Video.search_by_title params[:search_term]
  end

  def advanced_search
    options = {
      reviews:     params[:reviews],
      rating_from: params[:rating_from],
      rating_to:   params[:rating_to]
    }

    @videos = if params[:query]
      Video.search(params[:query], options).records.to_a
    else
      []
    end
  end
end
