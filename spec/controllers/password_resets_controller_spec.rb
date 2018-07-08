# spec/controllers/password_resets_controller_spec.rb

describe PasswordResetsController do
  describe 'GET show' do
    it 'renders show template if the token is valid' do
      alice = Fabricate :user
      alice.update_column :token, '12345'
      get :show, params: { id: '12345' }
      expect(response).to render_template :show
    end

    it 'sets @token' do
      alice = Fabricate :user
      alice.update_column :token, '12345'
      get :show, params: { id: '12345' }
      expect(assigns :token).to eq '12345'
    end

    it 'redirects to the expired token page if the token is not valid' do
      get :show, params: { id: '12345' }
      expect(response).to redirect_to expired_token_path
    end
  end

  describe 'POST create' do
    context 'with valid token' do
      it 'redirects to the sign-in page' do
        alice = Fabricate :user, password: 'old_password'
        alice.update_column :token, '12345'
        post :create, params: { token: '12345', password: 'new_password' }
        expect(alice.reload.authenticate 'new_password').to redirect_to sign_in_path
      end

      it "updates the user's password" do
        alice = Fabricate :user, password: 'old_password'
        alice.update_column :token, '12345'
        post :create, params: { token: '12345', password: 'new_password' }
        expect(alice.reload.authenticate 'new_password').to be_truthy
      end

      it 'sets the flash success message' do
        alice = Fabricate :user, password: 'old_password'
        alice.update_column :token, '12345'
        post :create, params: { token: '12345', password: 'new_password' }
        expect(alice.reload.authenticate 'new_password').to be_truthy
      end

      it 'regenerates the user token' do
        alice = Fabricate :user, password: 'old_password'
        alice.update_column :token, '12345'
        post :create, params: { token: '12345', password: 'new_password' }
        expect(alice.reload.token).not_to eq '12345'
      end
    end

    context 'with invalid token' do
      it 'redirects to the expired path' do
        post :create, params: { token: '12345', password: 'new_password' }
        expect(response).to redirect_to expired_token_path
      end
    end
  end
end
