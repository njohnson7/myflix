# app/models/invitation.rb

class Invitation < ApplicationRecord
  include Tokenable

  belongs_to :inviter, class_name: 'User', optional: true

  validates_presence_of :recipient_name, :recipient_email, :message
end
