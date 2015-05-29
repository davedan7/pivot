class Seed
  def self.start
    new.generate
    new.populate
  end

  def generate
    create_admins
    create_users
    create_businesses
    create_business_admins
    create_categories
    create_jobs
    create_job_categories
  end

  def populate
    populate_business_employer
    populate_job_applications
  end


  def create_admins
    User.create(name: "Josh Cheek", email: "demo+josh@jumpstartlab.com", username: "josh", password: "password", role: 2, location: "Denver")
    User.create(name: "Admin Admin", email: "admin@example.com", username: "ADMIN", password: "password", role: 2, location: "Denver")
  end

  def create_users
    User.create(name: "Rachel Warbelow", email: "demo+rachel@jumpstartlab.com", username: 'cellomaster', password: "password", role: 0, location: "Denver", description: "ImaTeacher")
    User.create(name: "Jeff Casimir", email: "demo+jeff@jumpstartlab.com", username: "j3", password: "password", role: 0, location: "Denver", description: "ImaTeacher")
    User.create(name: "Jorge Talez", email: "demo+jorge@jumpstartlab.com", username: "novohispano", password: "password", role: 0, location: "Denver", description: "ImaTeacher")
    User.create(name: "Josh Cheek", email: "demo+josh@jumpstartlab.com", username: "josh", password: "password", role: 0, location: "Denver", description: "ImaTeacher")
    User.create(name: "Default User", email: "default@example.com", username: "default", password: "password", role: 0, location: "Denver", description: "Default user for Heroku")
    20.times do
      User.create(name: Faker::Name.name, email: Faker::Internet.email, username: Faker::Internet.user_name, password: "password", role: 0, location: Faker::Address.city)
    end
  end

  def create_businesses
    User.create(name: "Turing School", email: "turing@example.com", username: "turing", password: "password", role: 1, location: "Denver", description: "We turn muggles into masters of code.", picture: File.new("#{Rails.root}/public/assets/turing-logo.png"))
    User.create(name: "Pivotuhl", email: "pivotuhl@example.com", username: "pivotal", password: "password", role: 1, location: "Denver", description: Faker::Hacker.say_something_smart, picture: Faker::Company.logo)
    User.create(name: "SlowRight", email: "slow@example.com", username: "slowright", password: "password", role: 1, location: "Denver", description: Faker::Hacker.say_something_smart, picture: Faker::Company.logo)
    User.create(name: "Skuukom", email: "skuukom@example.com", username: "skuukom", password: "password", role: 1, location: "Denver", description: Faker::Hacker.say_something_smart, picture: Faker::Company.logo)
    10.times do
      User.create(name: Faker::Company.name, email: Faker::Internet.email, username: Faker::Internet.user_name, password: "password", role: 1, location: Faker::Address.city, description: Faker::Lorem.sentence(4), picture: Faker::Company.logo)
    end
  end

  def create_business_admins
    User.create(name: "SlowRight Admin", email: "admin@slowright.com", username: "sadmin", password: "password", role: 3, location: "Denver", description: "I am teh admin of SlowRight", employer: User.find_by(username: 'slowright'))
    User.create(name: "David Admin", email: "admin@david.com", username: "davester", password: "password", role: 3, location: "Denver", description: "I am teh admin", employer: User.find_by(username: 'skuukom'))
    User.create(name: "Turing Admin", email: "admin@turing.com", username: "j3", password: "password", role: 3, location: "Denver", description: "Admin for Turing School", employer: User.find_by(username: 'turing'))
    User.create(name: "Pivotuhl Admin", email: "admin@pivotal.com", username: "padmin", password: "password", role: 3, location: "Denver", description: "Admin for Pivotuhl", employer: User.find_by(username: 'pivotal'))
    User.all.each { |user| puts "User #{user.name} created"}
  end

  def create_categories
    Category.create(name: "Ruby", description: "The mother of all languages")
    Category.create(name: "Javascript", description: "The coolest kid around")
    Category.create(name: "Front-end", description: "Make stuff pretty")
    Category.create(name: "Back-end", description: "Make stuff work")
    Category.create(name: "Administrative", description: "Someone's gotta run shit")
    Category.all.each { |category| puts "Category #{category.name} created"}
  end

  def create_jobs
    50.times do
      Job.create(title: Faker::Name.title, description: Faker::Hacker.say_something_smart + " " + Faker::Hacker.say_something_smart + " " + Faker::Hacker.say_something_smart + " " + Faker::Hacker.say_something_smart, posting_cost: rand(4..10), user_id: rand(1..User.count))
    end
    Job.all.each { |job| puts "Job #{job.title} created: #{job.description}"}
  end

  def create_job_categories
    50.times do
      JobCategory.create(job_id: rand(1..(Job.all.count)), category_id: rand(1..(Category.all.count)))
    end
    JobCategory.all.each { |job_category| puts "Job category created for Job: #{job_category.job_id}, Category: #{job_category.category_id}"}
  end

  def populate_job_applications
    100.times do
      JobApplication.create(user_id: rand(1..(User.all.count)), job_id: rand(1..Job.all.count), status: rand(0..2))
    end
    JobApplication.all.each { |application| puts "Application created. User: #{application.user_id}, Job: #{application.job_id}"}
  end

  def populate_business_employer
    users = User.where(role:1)
    users.each do |user|
      user.employer_id = user.id
      user.save
    end
  end

end

Seed.start
