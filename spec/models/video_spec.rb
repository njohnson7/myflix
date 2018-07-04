describe Video do
  it { should belong_to :category }
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }

  describe 'search_by_title' do
    it 'returns an empty array if there is no match' do
      expect(Video.search_by_title('abc')).to eq []

      video1 = Video.create title: 'Family Guy', description: 'desc'
      expect(Video.search_by_title('abc')).to eq []
    end

    it 'returns an array of one video for an exact match' do
      video1 = Video.create title: 'Family Guy', description: 'desc'
      expect(Video.search_by_title('Family Guy')).to eq [video1]
    end

    it 'returns an array of one video for a partial match' do
      video1 = Video.create title: 'Family Guy', description: 'desc'
      video2 = Video.create title: 'Cool', description: 'desc'
      expect(Video.search_by_title('Family')).to eq [video1]
      expect(Video.search_by_title('family')).to eq [video1]
      expect(Video.search_by_title('amily')).to eq [video1]
      expect(Video.search_by_title('family guy')).to eq [video1]
      expect(Video.search_by_title('Cool')).to eq [video2]
    end

    it 'returns an array of all matches ordered by created_at' do
      video1 = Video.create title: 'Family Guy', description: 'desc', created_at: 1.day.ago
      video2 = Video.create title: 'Family Man', description: 'desc'
      expect(Video.search_by_title 'Family').to eq [video2, video1]
    end

    it 'returns an empty array for a search with an empty string' do
      video1 = Video.create title: 'Family Guy', description: 'desc', created_at: 1.day.ago
      video2 = Video.create title: 'Family Man', description: 'desc'
      expect(Video.search_by_title '').to eq []
    end
  end
end
