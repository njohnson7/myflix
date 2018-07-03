class Category < ApplicationRecord
  has_many :videos, -> { order 'title' }
end
