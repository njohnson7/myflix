class Video < ApplicationRecord
  belongs_to :category, optional: true
end
