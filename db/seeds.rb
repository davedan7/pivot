# User.create(name: "Rachel Warbelow", email: "demo+rachel@jumpstartlab.com", password: "password")
# User.create(name: "Jeff Casimir", email: "demo+jeff@jumpstartlab.com", username: "j3", password: "password")
# User.create(name: "Jorge Talez", email: "demo+jorge@jumpstartlab.com", username: "novohispano", password: "password")
# User.create(name: "Josh Cheek", email: "demo+josh@jumpstartlab.com", username: "josh", password: "password", role: 1)

## Admins
User.create(name: "Josh Cheek", email: "demo+josh@jumpstartlab.com", username: "josh", password: "password", role: 2, location: "Denver")
User.create(name: "Admin Admin", email: "admin@example.com", username: "ADMIN", password: "password", role: 2, location: "Denver")

## Users
20.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, username: Faker::Internet.user_name, password: "password", role: 0, location: Faker::Address.city)
end

## Businesses
User.create(name: "Turing School", email: "turing@example.com", username: "turing", password: "password", role: 1, location: "Denver", description: "We turn muggles into masters of code.")
User.create(name: "Pivotuhl", email: "pivotuhl@example.com", username: "pivotal", password: "password", role: 1, location: "Denver", description: Faker::Hacker.say_something_smart)
User.create(name: "SlowRight", email: "slow@example.com", username: "slowright", password: "password", role: 1, location: "Denver", description: Faker::Hacker.say_something_smart) 
User.create(name: "Skuukom", email: "skuukom@example.com", username: "skuukom", password: "password", role: 1, location: "Denver", description: Faker::Hacker.say_something_smart) 
10.times do
  User.create(name: Faker::Company.name, email: Faker::Internet.email, username: Faker::Internet.user_name, password: "password", role: 1, location: Faker::Address.city, description: Faker::Lorem.sentence(4))
end

# Business Admins
User.create(name: "Turing School Admin", email: "admin@turing.com", username: "j3", password: "password", role: 3, location: "Denver", description: "Admin for Turing School")
User.create(name: "Pivotuhl Admin", email: "admin@example.com", username: "padmin", password: "password", role: 3, location: "Denver", description: "Admin for Pivotuhl")


## Categories
Category.create(name: "Ruby", description: "The mother of all languages")
Category.create(name: "Javascript", description: "The coolest kid around")
Category.create(name: "Front-end", description: "Make stuff pretty")
Category.create(name: "Back-end", description: "Make stuff work")
Category.create(name: "Administrative", description: "Someone's gotta run shit")

## Jobs
def businesses
  User.business
end

50.times do 
  Job.create(title: Faker::Name.title, description: Faker::Hacker.say_something_smart, posting_cost: rand(4..10), user_id: businesses.sample.id)
end

## Job-categories
50.times do
  JobCategory.create(job_id: rand(1..(Job.all.count-1)), category_id: rand(1..(Category.all.count-1)))
end
