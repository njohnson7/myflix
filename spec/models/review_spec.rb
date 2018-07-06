# spec/models/review_spec.rb

describe Review do
  it { should belong_to :user }
  it { should belong_to :video }
  it { should validate_presence_of :user }
  it { should validate_presence_of :video }
end
