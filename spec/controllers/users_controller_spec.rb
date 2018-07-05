describe UsersController do
  describe 'GET new' do
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
    let(:user) { Fabricate.build :user }
    it 'creates a new user with params' {
      post :create, params: { user: Fabricate.to_params(:user) }
      expect(assigns :user).to be_a User
    }

    it 'saves user when params valid' do
      post :create, params: { user: { email: user.email, password: user.password, full_name: user.full_name } }
      expect(User.last.email).to eq user.email
      expect(User.last.full_name).to eq user.full_name
      expect(User.count).to eq 1
    end

    it 'redirects to videos path when params valid' do
      post :create, params: { user: { email: user.email, password: user.password, full_name: user.full_name } }
      expect(response).to redirect_to videos_path
    end

    it 'sets session[:user_id] when params valid' do
      post :create, params: { user: { email: user.email, password: user.password, full_name: user.full_name } }
      expect(session[:user_id]).to eq User.last.id
    end

    it 'does not save user when params invalid' do
      post :create, params: { user: { email: 'aaa' } }
      expect(User.count).to eq 0
    end

    it 'renders the new template when params invalid' do
      post :create, params: { user: { email: 'aaa' } }
      expect(response).to render_template :new
    end
  end
end
