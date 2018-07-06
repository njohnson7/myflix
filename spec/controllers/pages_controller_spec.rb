# spec/controllers/pages_controller_spec.rb

describe PagesController do
  describe 'GET front' do
    it 'redirects to home for authenticated users' do
      session[:user_id] = Fabricate(:user).id
      get :front
      expect(response).to redirect_to home_path
    end
  end
end
