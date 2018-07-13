# app/models/video.rb

class Video < ApplicationRecord
  belongs_to :category, optional: true
  has_many :reviews, -> { order 'created_at DESC' }
  has_many :queue_items

  mount_uploader :large_cover, LargeCoverUploader
  mount_uploader :small_cover, SmallCoverUploader

  validates_presence_of :title, :description

  def self.search_by_title title
    return [] if title.blank?
    where('title ~* ?', title).order 'created_at DESC'
  end

  def rating
    reviews.count > 0 ? average_rating(reviews) : nil
  end

  def average_rating reviews
    reviews.map(&:rating).select(&:itself).sum.fdiv(reviews.size).round(1)
  end
end
