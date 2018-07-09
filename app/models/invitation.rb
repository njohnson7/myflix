# app/models/invitation.rb

class Invitation < ApplicationRecord
  belongs_to :inviter, class_name: 'User', optional: true

  validates_presence_of :recipient_name, :recipient_email, :message

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end
end
