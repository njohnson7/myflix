# app/models/review.rb

class Review < ApplicationRecord
  belongs_to :user,  optional: true
  belongs_to :video, optional: true

  validates_presence_of :user, :video

  # TODO: rename :body column to :content
  def content
    body
  end
end
