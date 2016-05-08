# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Create User Blogger
user = User.new(
  name: "mariu",
  email: "mariu@mamiamiga.com",
  password: "Mormina2010",
  role: 'blogger'
  )
user.skip_confirmation!
user.save!

# Create User Admin
user = User.new(
  name: "admin",
  email: "gianpietro1@gmail.com",
  password: "g14np13tr0",
  role: 'admin'
  )
user.skip_confirmation!
user.save!

# Create Topics
Topic.create!(
  name: 'Vida de Mami',
  description: 'Cosas que tienen que ver con Vida de Mami',
  user_id: User.find_by(name:"mariu").id
 )
Topic.create!(
  name: 'Inspírate',
  description: 'Cosas que tienen que ver con Inspirarse',
  user_id: User.find_by(name:"mariu").id
 )
Topic.create!(
  name: 'Moda Nosotras',
  description: 'Cosas que tienen que ver con Moda de Nosotras',
  user_id: User.find_by(name:"mariu").id
 )
Topic.create!(
  name: 'Moda Niños',
  description: 'Cosas que tienen que ver con Moda de Niños',
  user_id: User.find_by(name:"mariu").id
 )
Topic.create!(
  name: 'Engríete',
  description: 'Cosas que tienen que ver con Engreirse y ser Engreído',
  user_id: User.find_by(name:"mariu").id
 )
Topic.create!(
  name: 'Novedades',
  description: 'Cosas que tienen que ver con Novedades',
  user_id: User.find_by(name:"mariu").id
 )
topics = Topic.all


# Create Posts, the '!' (bang) is recommended to detect errors.
5.times do 
		featured = Faker::Avatar.image(Faker::Name.first_name, "1024x1024")
		slider = Faker::Avatar.image(Faker::Name.first_name, "1800x800")
	  post = Post.create!(
	    title: Faker::Lorem.sentence,
      topic: topics.sample,
	    content: Faker::Lorem.paragraph(50),
	    remote_featured_image_url: featured.gsub('http://','https://'),
	    remote_slider_image_url: slider.gsub('http://','https://'),
	        user_id: User.find_by(name:"mariu").id)
  	post.update_attributes!(created_at: rand(10.minutes .. 1.week).ago)
  end

45.times do 
	  post = Post.create!(
	    title: Faker::Lorem.sentence,
      topic: topics.sample,
	    content: Faker::Lorem.paragraph(10),
	    user_id: 1)
  	post.update_attributes!(created_at: rand(2.weeks .. 1.year).ago)
  end

posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph)
  end

puts "Seed finished"
puts "#{User.count} users created."
puts "#{Topic.count} topics created."
puts "#{Post.count} posts created."
puts "#{Comment.count} comments created."