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


  describe 'POST create' do
    it 'redirects to the my queue page' do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate :video
      post :create, params: { video_id: video.id }
      expect(response).to redirect_to my_queue_path
    end

    it 'creates a queue item' do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate :video
      post :create, params: { video_id: video.id }
      expect(QueueItem.count).to eq 1
    end

    it 'cretes the queue item that is associated with the video' do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate :video
      post :create, params: { video_id: video.id }
      expect(QueueItem.first.video).to eq video
    end

    it 'creates the queue item that is associated with the signed-in user' do
      alice = Fabricate :user
      session[:user_id] = alice.id
      video = Fabricate :video
      post :create, params: { video_id: video.id }
      expect(QueueItem.first.user).to eq alice
    end

    it 'puts the video as the last one in the queue' do
      alice             = Fabricate :user
      session[:user_id] = alice.id
      monk              = Fabricate :video
      Fabricate :queue_item, video: monk, user: alice
      south_park = Fabricate :video
      post :create, params: { video_id: south_park.id }
      south_park_queue_item = QueueItem.find_by video_id: south_park.id, user_id: alice.id
      expect(south_park_queue_item.position).to eq 2
    end

    it 'does not add the video to the queue if the video is already in the queue' do
      alice             = Fabricate :user
      session[:user_id] = alice.id
      monk              = Fabricate :video
      Fabricate :queue_item, video: monk, user: alice
      post :create, params: { video_id: monk.id }
      expect(alice.queue_items.count).to eq 1
    end

    it 'redirects to the sign-in page for unauthenticated users' do
      post :create, params: { video_id: 3 }
      expect(response).to redirect_to sign_in_path
    end
  end
end
