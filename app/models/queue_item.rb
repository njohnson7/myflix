class QueueItem < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :video, optional: true

  delegate :category, to: :video
  delegate :title, to: :video, prefix: :video

  def rating
    review = Review.find_by user_id: user.id, video_id: video.id
    review.rating if review
  end

  def category_name
    category.name
  end
end
