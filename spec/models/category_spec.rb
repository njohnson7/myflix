describe Category do
  it { should have_many :videos }

  it 'sorts videos by title' do
    category = Category.create name: 'Comedy'
    video1   = Video.create title: 'b', description: 'b description', category: category
    video2   = Video.create title: 'c', description: 'b description'

    expect(Category.first.videos.first).to eq video1
    expect(Video.first.category).to eq category

    category.videos << video2

    expect(Category.first.videos.last).to eq video2
    expect(Category.first.videos.size).to eq 2

    expect(category.videos).to include video1, video2
    expect(category.videos).to eq [video1, video2]

    video3 = Video.new title: 'a', description: 'b description'
    category.videos << video3

    # reorder
    category.reload
    expect(category.videos.first).to eq video3
    expect(category.videos).to eq [video3, video1, video2]

    video4 = Video.create(title: 'bb', description: 'b description', category: category)
    category.reload
    expect(category.videos).to eq [video3, video1, video4, video2]
  end

  describe '#recent_videos' do
    it 'returns [] if the category has no videos' do
      comedy = Category.create name: 'Comedy'
      expect(comedy.recent_videos).to eq []
    end

    it 'returns an array of all videos in reverse chronological order (most recent first) by created_at if less than six videos in category' do
      comedy = Category.create name: 'Comedy'
      video1 = Video.create title: 'video1', description: 'desc', category: comedy
      video2 = Video.create title: 'video2', description: 'desc', category: comedy, created_at: 2.day.ago
      video3 = Video.create title: 'video3', description: 'desc', category: comedy, created_at: 1.days.ago
      video4 = Video.create title: 'video4', description: 'desc', category: comedy, created_at: 3.days.ago
      comedy.reload
      expect(comedy.recent_videos).to eq [video1, video3, video2, video4]
    end

    it 'returns an array of most recent six videos in category if more than six videos' do
      comedy = Category.create name: 'Comedy'
      video1 = Video.create title: 'video1', description: 'desc', category: comedy
      video2 = Video.create title: 'video2', description: 'desc', category: comedy, created_at: 2.day.ago
      video3 = Video.create title: 'video3', description: 'desc', category: comedy, created_at: 1.days.ago
      video4 = Video.create title: 'video4', description: 'desc', category: comedy, created_at: 3.days.ago
      video5 = Video.create title: 'video5', description: 'desc', category: comedy
      video6 = Video.create title: 'video6', description: 'desc', category: comedy
      video7 = Video.create title: 'video7', description: 'desc', category: comedy
      comedy.reload
      expect(comedy.recent_videos).to eq [video7, video6, video5, video1, video3, video2]
      expect(comedy.recent_videos).not_to include(video4)
    end
  end
end
