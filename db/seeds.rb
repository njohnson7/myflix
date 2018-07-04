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
Video.create title: 'Monk', description: 'this is Monk', small_cover_url: '/tmp/monk.jpg', large_cover_url: '/tmp/monk_large.jpg', category: Category.first
Video.create title: 'Futurama', description: 'this is Futurama', small_cover_url: '/tmp/futurama.jpg', large_cover_url: '/tmp/futurama.jpg', category: Category.last
Video.create title: 'South Park', description: 'this is South Park', small_cover_url: '/tmp/south_park.jpg', large_cover_url: '/tmp/south_park.jpg', category: Category.last
