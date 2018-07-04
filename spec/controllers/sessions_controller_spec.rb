describe SessionsController do
  describe 'GET sign_in' do
    it 'redirects to home for authenticated users' do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to home_path
    end
  end

  describe 'POST sign_in' do
    it 'sets session id to user_id when valid login' do
      params = Fabricate.to_params :user
      user   = User.create(params)
      post :create, params: params
      expect(session[:user_id]).to eq user.id
    end

    it 'redirects to home when valid login' do
      params = Fabricate.to_params :user
      user = User.create(params)
      post :create, params: params
      expect(response).to redirect_to home_path
    end

    it 'renders new when invalid login' do
      params = Fabricate.to_params :user
      user = User.create(params)
      post :create, params: { email: 'asd@ad.com', password: 'a' }
      expect(response).to render_template :new
    end
  end

  describe 'DELETE sign_out' do
    it 'sets session id to nil' do
      delete :destroy
      expect(session[:user_id]).to eq nil
    end

    it 'redirects to root path' do
      delete :destroy
      expect(response).to redirect_to root_path
    end
  end
end
