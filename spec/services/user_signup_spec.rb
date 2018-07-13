# spec/services/user_signup_spec.rb

describe UserSignup do
  describe '#sign_up' do
    # context 'valid personal info and valid card' do
    #   let(:user) { Fabricate.build :user }
    #   let(:charge) { double(:charge, successful?: true) }
    #   before do
    #     allow(StripeWrapper::Charge).to receive(:create).and_return(charge)
    #   end

    #   it 'saves user when params valid' do
    #     post :create, params: { user: { email: user.email, password: user.password, full_name: user.full_name } }
    #     expect(User.last.email).to eq user.email
    #     expect(User.last.full_name).to eq user.full_name
    #     expect(User.count).to eq 1
    #   end

    #   it 'makes the user follow the inviter' do
    #     alice      = Fabricate :user
    #     invitation = Fabricate :invitation, inviter: alice, recipient_email: 'joe@example.com'
    #     post :create, params: { user: { email: 'joe@example.com', password: 'password', full_name: 'Joe Doe' }, invitation_token: invitation.token }
    #     joe = User.find_by email: 'joe@example.com'
    #     expect(joe.follows? alice).to be true
    #   end

    #   it 'makes the inviter follow the user' do
    #     alice      = Fabricate :user
    #     invitation = Fabricate :invitation, inviter: alice, recipient_email: 'joe@example.com'
    #     post :create, params: { user: { email: 'joe@example.com', password: 'password', full_name: 'Joe Doe' }, invitation_token: invitation.token }
    #     joe = User.find_by email: 'joe@example.com'
    #     expect(alice.follows? joe).to be true
    #   end

    #   it 'expires the invitation upon acceptance' do
    #     alice      = Fabricate :user
    #     invitation = Fabricate :invitation, inviter: alice, recipient_email: 'joe@example.com'
    #     post :create, params: { user: { email: 'joe@example.com', password: 'password', full_name: 'Joe Doe' }, invitation_token: invitation.token }
    #     joe = User.find_by email: 'joe@example.com'
    #     expect(Invitation.first.token).to be_nil
    #   end
    # end
  end
end
