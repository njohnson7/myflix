# spec/controllers/videos_controller_spec.rb

describe VideosController do
  describe 'GET show' do
    it 'sets @video for authenticated users' do
      user = Fabricate :user
      session[:user_id] = user.id
      video             = Fabricate :video
      get :show, params: { id: video.id }
      expect(assigns :video).to eq video
    end

    it 'redirects the user to the sign in page for unauthenticated users' do
      video = Fabricate :video
      get :show, params: { id: video.id }
      expect(response).to redirect_to sign_in_path
    end

    it 'has reviews for auth users' do
      user = Fabricate :user
      session[:user_id] = user.id
      video             = Fabricate :video
      review1           = Fabricate :review, video: video, user: user
      review2           = Fabricate :review, video: video, user: user
      get :show, params: { id: video.id }
      expect(video.reviews).to match_array [review1, review2]
    end
  end

  describe 'GET search' do
    it 'sets @videos for authenticated users' do
      user = Fabricate :user
      session[:user_id] = user.id
      futurama          = Fabricate :video, title: 'Futurama'
      get :search, params: { search_term: 'rama' }
      expect(assigns :videos).to eq [futurama]
    end

    it 'redirects to sign in page for unauthenticated users' do
      futurama = Fabricate :video, title: 'Futurama'
      get :search, params: { search_term: 'rama' }
      expect(response).to redirect_to sign_in_path
    end
  end
end
