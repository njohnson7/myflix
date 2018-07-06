# spec/support/macros.rb

def set_current_user user = Fabricate(:user)
  session[:user_id] = user.id
end

def sign_in user = Fabricate(:user)
  visit         sign_in_path
  fill_in      'Email Address', with: user.email
  fill_in      'Password',      with: user.password
  click_button 'Sign in'
  page.should have_content user.full_name
end
