describe QueueItemsController do
  describe 'GET index' do
    it 'sets @queue+_items to the queue items of the logged-in user' do
      alice = Fabricate :user
      session[:user_id] = alice.id
      queue_item1 = Fabricate :queue_item, user: alice
      queue_item2 = Fabricate :queue_item, user: alice
      get :index
      expect(assigns :queue_items).to match_array [queue_item1, queue_item2]
    end
    it 'redirects to the sign-in page for unauth users' do
      get :index
      expect(response).to redirect_to sign_in_path
    end
  end
end
