describe ReviewsController do
  describe 'POST create' do
    it 'should create new review' do
      video = Fabricate :video
      user = Fabricate :user
      session[:user_id] = user.id
      post :create, params: { video_id: video.id, review: Fabricate.to_params(:review) }
      expect(assigns(:review)).to be_a Review
    end
  end
end
