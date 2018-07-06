# spec/models/user_spec.rb

describe User do
  it { should have_many :reviews }
end
