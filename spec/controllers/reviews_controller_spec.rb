describe ReviewsController do
  describe 'POST create' do
    it 'should create new review' do
      video             = Fabricate :video
      user              = Fabricate :user
      session[:user_id] = user.id
      post :create, params: { video_id: video.id, review: Fabricate.to_params(:review) }
      expect(assigns(:review)).to be_a Review
    end

    context 'with auth users' do
      let(:current_user) { Fabricate :user }
      let(:video) { Fabricate :video }
      before { session[:user_id] = current_user.id }

      context 'with valid inputs' do
        before do
          post :create, params: { review: Fabricate.to_params(:review), video_id: video.id }
        end
        it 'redirects to the video show page' do
          expect(response).to redirect_to p(video)
        end
        it 'creates a review' do
          expect(Review.count).to eq 1
        end
        it 'creates a review associated with the video' do
          expect(Review.first.video).to eq video
        end
        it 'creates a review associated with the signed-in user' do
          expect(Review.first.user).to eq current_user
        end
      end

      context 'with invalid inputs' do
        let(:video) { Fabricate :video }
        # it 'does not create a review'
        # it 'renders the video show template'
      end
    end

    context 'with unauth users' do
      let(:video) { Fabricate :video }
      before { session[:user_id] = nil }

      it 'does not create a review' do
        post :create, params: { review: Fabricate.to_params(:review), video_id: video.id }
        expect(Review.count).to eq 0
      end
    end
  end
end
