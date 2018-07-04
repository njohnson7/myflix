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
end

