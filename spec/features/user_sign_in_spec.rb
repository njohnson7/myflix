# spec/features/user_sign_in_spec.rb

feature 'user signs in' do
  scenario 'with valid email and password'  do
    alice = Fabricate :user
    sign_in alice
  end
end
