# spec/fabricators/video_fabricator.rb

Fabricator :video do
  title       { Faker::Lorem.words(5).join ' ' }
  description { Faker::Lorem.paragraph 2 }
  category    { Category.first }
end
