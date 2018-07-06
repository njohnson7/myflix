# spec/fabricators/category_fabricator.rb

Fabricator :category do
  name { Faker::Lorem.words 1 }
end
