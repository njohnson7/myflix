# app/models/category.rb

class Category < ApplicationRecord
  has_many :videos, -> { order 'title' }
  has_many :queue_items
  # has_many :videos, -> { order 'created_at DESC' }

  validates_presence_of :name

  def recent_videos
    Video.where('category_id = ?', id).order('created_at DESC').limit(6)
  end
end
