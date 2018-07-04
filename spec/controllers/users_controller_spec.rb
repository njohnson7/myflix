describe UsersController do
  describe 'GET register' do
    it 'redirects to home for authenticated users' do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to home_path
    end

    it 'sets @user to a new user for unauthenticated users' do
      get :new
      expect(assigns :user).to be_a User
      expect(assigns(:user).id).to eq nil
    end
  end

  describe 'POST create' do
    it 'creates a new user with params' do
      user = Fabricate.build(:user)
      post :create, params: { user: user.attributes }
      expect(assigns(:user)).to be_a User
    end

    it 'saves user when params valid' do
      user = Fabricate.build(:user)
      post :create, params: { user: { email: user.email, password: user.password, full_name: user.full_name } }
      expect(User.last.email).to eq user.email
      expect(User.last.full_name).to eq user.full_name
    end

    it 'redirects to videos path when params valid' do
      user = Fabricate.build(:user)
      post :create, params: { user: { email: user.email, password: user.password, full_name: user.full_name } }
      expect(response).to redirect_to videos_path
    end

    it 'sets session[:user_id] when params valid' do
      user = Fabricate.build(:user)
      post :create, params: { user: { email: user.email, password: user.password, full_name: user.full_name } }
      expect(session[:user_id]).to eq User.last.id
    end

    it 'does not save user when params invalid' do
      post :create, params: { user: { email: 'aaa' } }
      expect(User.last.email).not_to eq 'aaa'
    end

    it 'renders the new template when params invalid' do
      post :create, params: { user: { email: 'aaa' } }
      expect(response).to render_template :new
    end
  end
end
