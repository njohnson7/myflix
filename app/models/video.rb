class Video < ApplicationRecord
  belongs_to            :category, optional: true
  validates_presence_of :title, :description

  def self.search_by_title title
    return [] if title.blank?
    where('title LIKE ?', "%#{title}%").order 'created_at DESC'
  end
end
