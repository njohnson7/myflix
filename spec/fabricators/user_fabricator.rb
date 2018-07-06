# spec/fabricators/user_fabricator.rb

Fabricator :user do
  email     { Faker::Internet.email }
  password  { 'password' }
  full_name { Faker::Name.name }
end
