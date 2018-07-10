# app/models/queue_item.rb

class QueueItem < ApplicationRecord
  belongs_to :user,  optional: true
  belongs_to :video, optional: true

  delegate :category, to: :video
  delegate :title,    to: :video, prefix: :video

  validates_numericality_of :position, only_integer: true

  def rating
    review.rating if review
  end

  def rating= new_rating
    if review
      review.update_column(:rating, new_rating)
    else
      Review.create(user: user, video: video, rating: new_rating)
    end
  end

  def category_name
    category.name
  end

  private

  def review
    @review ||= Review.find_by(user_id: user.id, video_id: video.id)
  end
end
