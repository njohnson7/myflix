class Video < ApplicationRecord
  belongs_to :category, optional: true

  validates_presence_of :title, :description
end
