class User < ApplicationRecord
  has_secure_password validations: false
  validates_presence_of :email, :password, :full_name
  validates :email, uniqueness: true
end
