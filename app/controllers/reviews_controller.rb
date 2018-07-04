class ReviewsController < ApplicationController
  before_action :require_user

  def create
    @review       = Review.new params.require(:review).permit(:rating, :body)
    @review.user  = current_user
    @review.video = Video.find params[:video_id]

    if @review.save
      flash[:notice] = 'Review created'
      redirect_to video_path(@review.video)
    else
      render 'videos/video'
    end
  end
end
