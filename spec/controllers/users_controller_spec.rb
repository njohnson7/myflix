# spec/controllers/users_controller_spec.rb

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
    let(:charge) { double(:charge, successful?: true) }
    before do
      allow(StripeWrapper::Charge).to receive(:create).and_return(charge)
    end

    it 'creates a new user with params' do
      post :create, params: { user: Fabricate.to_params(:user) }
      expect(assigns :user).to be_a User
    end

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

    it 'makes the user follow the inviter' do
      alice      = Fabricate :user
      invitation = Fabricate :invitation, inviter: alice, recipient_email: 'joe@example.com'
      post :create, params: { user: { email: 'joe@example.com', password: 'password', full_name: 'Joe Doe' }, invitation_token: invitation.token }
      joe = User.find_by email: 'joe@example.com'
      expect(joe.follows? alice).to be true
    end

    it 'makes the inviter follow the user' do
      alice      = Fabricate :user
      invitation = Fabricate :invitation, inviter: alice, recipient_email: 'joe@example.com'
      post :create, params: { user: { email: 'joe@example.com', password: 'password', full_name: 'Joe Doe' }, invitation_token: invitation.token }
      joe = User.find_by email: 'joe@example.com'
      expect(alice.follows? joe).to be true
    end

    it 'expires the invitation upon acceptance' do
      alice      = Fabricate :user
      invitation = Fabricate :invitation, inviter: alice, recipient_email: 'joe@example.com'
      post :create, params: { user: { email: 'joe@example.com', password: 'password', full_name: 'Joe Doe' }, invitation_token: invitation.token }
      joe = User.find_by email: 'joe@example.com'
      expect(Invitation.first.token).to be_nil
    end

    context 'valid personal info and declined card' do
      it 'does not create a new user record' do
        charge = double(:charge, successful?: false, error_message: 'Your card was declined.')
        allow(StripeWrapper::Charge).to receive(:create).and_return(charge)
        post :create, params: { user: Fabricate.to_params(:user), stripeToken: '1231241' }
        expect(User.count).to eq 0
      end

      it 'renders the new template' do
        charge = double(:charge, successful?: false, error_message: 'Your card was declined.')
        allow(StripeWrapper::Charge).to receive(:create).and_return(charge)
        post :create, params: { user: Fabricate.to_params(:user), stripeToken: '1231241' }
        expect(response).to render_template :new
      end

      it 'sets the flash error message' do
        charge = double(:charge, successful?: false, error_message: 'Your card was declined.')
        allow(StripeWrapper::Charge).to receive(:create).and_return(charge)
        post :create, params: { user: Fabricate.to_params(:user), stripeToken: '1231241' }
        expect(flash[:error]).to be_present
      end
    end

    context 'invalid personal info' do
      it 'does not create a user' do
        post :create, params: { user: { email: 'aaa' } }
        expect(User.count).to eq 0
      end

      it 'renders the new template' do
        post :create, params: { user: { email: 'aaa' } }
        expect(response).to render_template :new
      end

      it 'renders the new template' do
        StripeWrapper::Charge.should_not_receive :create
        post :create, params: { user: { email: 'aaa' } }
      end
    end

    context 'sending emails' do
      let(:charge) { double(:charge, successful?: true) }
      before do
        allow(StripeWrapper::Charge).to receive(:create).and_return(charge)
      end
      after { ActionMailer::Base.deliveries.clear }

      it 'sends out email to the user with valid inputs' do
        post :create, params: { user: { email: 'joe@example.com', password: 'password', full_name: 'Joe Smith' } }
        expect(ActionMailer::Base.deliveries.last.to).to eq ['joe@example.com']
      end

      it 'sends out email to the user with valid inputs' do
        post :create, params: { user: { email: 'joe@example.com', password: 'password', full_name: 'Joe Smith' } }
        expect(ActionMailer::Base.deliveries.last.body).to include 'Joe Smith'
      end

      it "does not send out email with invalid inputs" do
        post :create, params: { user: { email: 'joe@example.com' } }
        expect(ActionMailer::Base.deliveries).to be_empty
      end
    end
  end

  describe 'GET show' do
    it_behaves_like 'requires sign in' do
      let(:action) { get :show, params: { id: 3 } }
    end

    it 'sets @user' do
      set_current_user
      alice = Fabricate :user
      get :show, params: { id: alice.id }
      expect(assigns :user).to eq alice
    end
  end

  describe 'GET new_with_invitation_token' do
    it 'renders the :new view template' do
      invitation = Fabricate :invitation
      get :new_with_invitation_token, params: { token: invitation.token }
      expect(assigns(:user).email).to eq invitation.recipient_email
    end

    it "sets @user with recipient's email" do
      invitation = Fabricate :invitation
      get :new_with_invitation_token, params: { token: invitation.token }
      expect(assigns(:user).email).to eq invitation.recipient_email
    end

    it 'sets @invitation_token' do
      invitation = Fabricate :invitation
      get :new_with_invitation_token, params: { token: invitation.token }
      expect(assigns :invitation_token).to eq invitation.token
    end

    it 'redirects to expired token page for invalid tokens' do
      get :new_with_invitation_token, params: { token: 'aSDASDASD' }
      expect(response).to redirect_to expired_token_path
    end
  end
end
