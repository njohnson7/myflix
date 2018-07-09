# spec/models/invitation_spec.rb

describe Invitation do
  it { should validate_presence_of :recipient_name }
  it { should validate_presence_of :recipient_email }
  it { should validate_presence_of :message }
end
