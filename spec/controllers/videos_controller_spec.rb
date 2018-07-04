describe VideosController do
  describe 'GET show' do
    it 'sets the @video variable' do
      user  = User.create email: 'a@a.com', password: 'a', full_name: 'a a'
      video = Video.create title: 'a', description: 'aaa'
      get :show, params: { id: video.id }, session: { user_id: user.id }
      assigns(:video).should == video
    end

    it 'renders the show template' do
      user  = User.create email: 'a@a.com', password: 'a', full_name: 'a a'
      video = Video.create title: 'a', description: 'aaa'
      get :show, params: { id: video.id }, session: { user_id: user.id }
      response.should render_template :show
    end
  end

  describe 'GET search' do
    it 'sets the @videos variable' do
      user   = User.create email: 'a@a.com', password: 'a', full_name: 'a a'
      video1 = Video.create title: 'a', description: 'desc'
      video2 = Video.create title: 'cat', description: 'desc'
      video3 = Video.create title: 'cob', description: 'desc'
      get :search, params: { search_term: 'a' }, session: { user_id: user.id }
      expect(assigns(:videos)).to include video1, video2
      expect(assigns(:videos)).not_to include video3
    end

    it 'renders the search template' do
      user = User.create email: 'a@a.com', password: 'a', full_name: 'a a'
      get :search, params: { search_term: 'a' }, session: { user_id: user.id }
      expect(response).to render_template :search
    end
  end
end
