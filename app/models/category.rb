class Category < ApplicationRecord
  has_many :videos, -> { order 'title' }

  def recent_videos
    Video.where('category_id = ?', id).order('created_at DESC').limit(6)
  end
end
