# spec/support/macros.rb

def set_current_user user = Fabricate(:user)
  session[:user_id] = user.id
end

def set_current_admin admin = Fabricate(:admin)
  session[:user_id] = admin.id
end

def sign_in user = Fabricate(:user)
  visit         sign_in_path
  fill_in      'Email Address', with: user.email
  fill_in      'Password',      with: user.password
  click_button 'Sign in'
  page.should have_content user.full_name
end

def click_on_video_on_home_page video
  find("a[href='/videos/#{video.id}']").click
end

def sign_out
  click_link 'Welcome'
  click_link 'Sign Out'
end
