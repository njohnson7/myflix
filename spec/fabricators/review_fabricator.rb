# spec/fabricators/review_fabricator.rb

Fabricator :review do
  rating { Faker::Number.between 1, 5 }
  body   { Faker::Lorem.paragraph 2 }
end
