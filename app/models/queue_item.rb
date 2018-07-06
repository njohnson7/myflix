# app/models/queue_item.rb

class QueueItem < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :video, optional: true

  delegate :category, to: :video
  delegate :title,    to: :video, prefix: :video

  validates_numericality_of :position, { only_integer: true }

  def rating
    review = Review.find_by user_id: user.id, video_id: video.id
    review.rating if review
  end

  def category_name
    category.name
  end
end
