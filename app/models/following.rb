# app/models/following.rb

class Following < ApplicationRecord
  belongs_to :user
  belongs_to :follower, foreign_key: 'user_id', class_name: 'User'

  validates_uniqueness_of :user_id, scope: :follower_id
  validate :realism

  private

  def realism
    return unless user_id == follower_id
    errors.add :user, "You can't follow yourself."
  end
end
