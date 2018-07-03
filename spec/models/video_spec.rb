describe Video do
  it 'saves itself' do
    category = Category.create name: 'Comedy'
    video    = Video.new title: 'Family Guy', description: 'this is Family Guy', category: category
    video.save
    Video.first.title.should       == 'Family Guy'
    Video.first.description.should == 'this is Family Guy'
  end
end
