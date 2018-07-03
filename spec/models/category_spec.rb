describe Category do
  it 'saves itself' do
    category = Category.new name: 'Comedy'
    category.save

    expect(Category.first).to eq category
  end

  it 'has many videos' do
    category = Category.create name: 'Comedy'
    video1   = Video.create title: 'b', category: category
    video2   = Video.create title: 'c'

    expect(Category.first.videos.first).to eq video1
    expect(Video.first.category).to eq category

    category.videos << video2

    expect(Category.first.videos.last).to eq video2
    expect(Category.first.videos.size).to eq 2

    expect(category.videos).to include video1, video2
    expect(category.videos).to eq [video1, video2]

    video3 = Video.new(title: 'a')
    category.videos << video3

    # reorder
    category.reload
    expect(category.videos.first).to eq video3
    expect(category.videos).to eq [video3, video1, video2]

    video4 = Video.create(title: 'bb', category: category)
    category.reload
    expect(category.videos).to eq [video3, video1, video4, video2]
  end
end
