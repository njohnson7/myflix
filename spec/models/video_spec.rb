describe Video do
  it 'saves itself' do
    # category = Category.create name: 'Comedy'
    # video    = Video.new title: 'Family Guy', description: 'this is Family Guy', category: category

    video = Video.new title: 'Family Guy', description: 'this is Family Guy'
    video.save

    Video.first.title.should       == 'Family Guy'
    Video.first.description.should == 'this is Family Guy'

    expect(Video.first).to eq(video)
    Video.first.should == video
    Video.first.should eq(video)
  end
end
