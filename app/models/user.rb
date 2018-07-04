class User < ApplicationRecord
  has_secure_password validations: false
  validates_presence_of   :email, :password, :full_name
  validates_uniqueness_of :email

  has_many :reviews, -> { order 'created_at DESC' }
end
