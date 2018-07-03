class Category < ApplicationRecord
  has_many :videos, -> { order 'title' }
  # has_many :videos
end
