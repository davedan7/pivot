    populate_job_applications
  end


  def create_admins
    User.create(name: "Jorge", email: "jorge@turing.io", username: "jorge", password: "password", role: 2, location: "Mexico")
    User.create(name: "Admin Admin", email: "admin@example.com", username: "ADMIN", password: "password", role: 2, location: "Denver")
  end

  def create_users
    User.create(name: "Rachel Warbelow", email: "demo+rachel@jumpstartlab.com", username: 'cellomaster', password: "password", role: 0, location: "Denver", description: "ImaTeacher")
    User.create(name: "Jeff Casimir", email: "demo+jeff@jumpstartlab.com", username: "j3", password: "password", role: 0, location: "Denver", description: "ImaTeacher")
    User.create(name: "Jorge Talez", email: "demo+jorge@jumpstartlab.com", username: "novohispano", password: "password", role: 0, location: "Denver", description: "ImaTeacher")
    User.create(name: "Josh Mejia", email: "josh@turing.io", username: "josh", password: "password", role: 0, location: "Denver", description: "ImaTeacher")
    User.create(name: "Default User", email: "default@example.com", username: "default", password: "password", role: 0, location: "Denver", description: "Default user for Heroku")
    100.times do
      User.create(name: Faker::Name.name, email: Faker::Internet.email, username: Faker::Internet.user_name, password: "password", role: 0, location: Faker::Address.city)
    end
  end

  def create_businesses
    User.create(name: "Turing School", email: "turing@example.com", username: "turing", password: "password", role: 1, location: "Denver", description: "We turn muggles into masters of code.", picture: File.new("#{Rails.root}/public/assets/turing-logo.png"), pending: false, business_status: true)
    User.create(name: "Pivotuhl", email: "pivotuhl@example.com", username: "pivotal", password: "password", role: 1, location: "Denver", description: Faker::Hacker.say_something_smart, picture: Faker::Company.logo, business_status: true)
    User.create(name: "SlowRight", email: "slow@example.com", username: "slowright", password: "password", role: 1, location: "Denver", description: Faker::Hacker.say_something_smart, picture: Faker::Company.logo, business_status: true)
    User.create(name: "Skuukom", email: "skuukom@example.com", username: "skuukom", password: "password", role: 1, location: "Denver", description: Faker::Hacker.say_something_smart, picture: Faker::Company.logo, business_status: true)
    20.times do
      User.create(name: Faker::Company.name, email: Faker::Internet.email, username: Faker::Internet.user_name, password: "password", role: 1, location: Faker::Address.city, description: Faker::Lorem.sentence(4), picture: Faker::Company.logo, pending: false, business_status: true)
    end
  end

  def create_business_admins
    User.create(name: "Sam the Admin", email: "sam@turing.io", username: "sam", password: "password", role: 3, location: "Denver", description: "I teach teh Javascripts!", employer: User.find_by(username: 'turing'))
    User.create(name: "SlowRight Admin", email: "admin@slowright.com", username: "sadmin", password: "password", role: 3, location: "Denver", description: "I am teh admin of a Company", employer: User.find_by(username: 'slowright'))
    User.create(name: "David Admin", email: "admin@david.com", username: "davester", password: "password", role: 3, location: "Denver", description: "I am teh admin", employer: User.find_by(username: 'skuukom'))
    User.create(name: "Turing Admin", email: "admin@turing.com", username: "j3", password: "password", role: 3, location: "Denver", description: "Admin for our school", employer: User.find_by(username: 'turing'))
    User.create(name: "Pivotuhl Admin", email: "admin@pivotal.com", username: "padmin", password: "password", role: 3, location: "Denver", description: "I am the admin for a consulting company.", employer: User.find_by(username: 'pivotal'))
    User.all.each { |user| puts "User #{user.name} created"}
  end

  def create_categories
    Category.create(name: "Ruby", description: "The mother of all languages")
    Category.create(name: "Javascript", description: "The coolest kid around")
    Category.create(name: "C++", description: "Old fart")
    Category.create(name: 'C#', description: "Old sharp fart")
    Category.create(name: ".NET", description: "Microsoft is awful")
    Category.create(name: "COBOL", description: "STILL AROUND, BABY!")
    Category.create(name: "Go", description: "Fasted 40 time")
    Category.create(name: "Front-end", description: "Make stuff pretty")
    Category.create(name: "Back-end", description: "Make stuff work")
    Category.create(name: "Administrative", description: "Someone's gotta run shit")
    Category.all.each { |category| puts "Category #{category.name} created"}
  end

  def create_jobs
    businesses = User.where(role: 1)
    500.times do
      Job.create(title: Faker::Name.title, description: Faker::Hacker.say_something_smart + " " + Faker::Hacker.say_something_smart + " " + Faker::Hacker.say_something_smart + " " + Faker::Hacker.say_something_smart, posting_cost: rand(4..10), user_id: businesses[rand(0..(businesses.count-1))].id)
    end
    Job.all.each { |job| puts "Job #{job.title} created: #{job.description}"}
  end

  def create_job_categories
    50.times do
      JobCategory.create(job_id: rand(1..(Job.all.count)), category_id: rand(1..(Category.all.count)))
    end
    JobCategory.all.each { |job_category| puts "Job category created for Job: #{job_category.job_id}, Category: #{job_category.category_id}"}
  end

  # def populate_job_applications
  #   normal_users = User.where(role:0)
  #   100.times do
  #     JobApplication.create(user_id: normal_users[rand(0..(normal_users.count-1))].id, job_id: rand(1..Job.all.count), status: rand(0..2))
  #   end
  #   JobApplication.all.each { |application| puts "Application created. User: #{application.user_id}, Job: #{application.job_id}"}
  # end

  def populate_job_applications
    User.where(role:0).each do |user|
      10.times do
        user.job_applications.create(user_id: user.id, job_id: rand(1..Job.all.count), status: rand(0..2))
      end
    end
    JobApplication.all.each { |application| puts "Application created. User: #{application.user_id}, Job: #{application.job_id}"}
  end

  def populate_business_employer
    businesses = User.where(role:1)
    businesses.each do |business|
      business.employer_id = business.id
      business.save
    end
  end

end

Seed.start
