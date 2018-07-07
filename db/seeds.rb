# db/seeds.rb

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create name: 'Comedy'
Category.create name: 'Drama'

Video.create title: 'Family Guy', description: 'this is Family Guy', small_cover_url: '/tmp/family_guy.jpg', large_cover_url: '/tmp/family_guy.jpg', category: Category.first
Video.create title: 'Monk',       description: 'this is Monk',       small_cover_url: '/tmp/monk.jpg', large_cover_url: '/tmp/monk_large.jpg', category: Category.first
Video.create title: 'Futurama',   description: 'this is Futurama',   small_cover_url: '/tmp/futurama.jpg', large_cover_url: '/tmp/futurama.jpg', category: Category.last, created_at: 1.day.ago
Video.create title: 'Futurama',   description: 'this is Futurama',   small_cover_url: '/tmp/futurama.jpg', large_cover_url: '/tmp/futurama.jpg', category: Category.last, created_at: 1.day.ago
Video.create title: 'Futurama',   description: 'this is Futurama',   small_cover_url: '/tmp/futurama.jpg', large_cover_url: '/tmp/futurama.jpg', category: Category.last, created_at: 1.day.ago
Video.create title: 'South Park', description: 'this is South Park', small_cover_url: '/tmp/south_park.jpg', large_cover_url: '/tmp/south_park.jpg', category: Category.last
Video.create title: 'South Park', description: 'this is South Park', small_cover_url: '/tmp/south_park.jpg', large_cover_url: '/tmp/south_park.jpg', category: Category.last
Video.create title: 'South Park', description: 'this is South Park', small_cover_url: '/tmp/south_park.jpg', large_cover_url: '/tmp/south_park.jpg', category: Category.last
Video.create title: 'South Park', description: 'this is South Park', small_cover_url: '/tmp/south_park.jpg', large_cover_url: '/tmp/south_park.jpg', category: Category.last
Video.create title: 'South Park', description: 'this is South Park', small_cover_url: '/tmp/south_park.jpg', large_cover_url: '/tmp/south_park.jpg', category: Category.last
Video.create title: 'South Park', description: 'this is South Park', small_cover_url: '/tmp/south_park.jpg', large_cover_url: '/tmp/south_park.jpg', category: Category.last

User.create email: 'a@a', password: 'a', full_name: 'AA'
User.create email: 'b@b', password: 'b', full_name: 'BB'

Review.create rating: 5, body: 'asjdhasjdhashjd', user: User.first, video: Video.first
Review.create rating: 5, body: 'bbbbbbbbbbbbb',   user: User.first, video: Video.first
Review.create rating: 5, body: 'ccccccccccc',     user: User.first, video: Video.first
Review.create rating: 4, body: 'zzzzzzzzzzzzzzz', user: User.first, video: Video.first
Review.create rating: 1, body: 'old review',      user: User.first, video: Video.first, created_at: 1.day.ago
Review.create rating: 2, body: 'BB review1',      user: User.last,  video: Video.first
Review.create rating: 2, body: 'BB review2',      user: User.last,  video: Video.last
Review.create rating: 2, body: 'BB review3',      user: User.last,  video: Video.last
Review.create rating: 2, body: 'aaaaa!!!',        user: User.first,  video: Video.last
