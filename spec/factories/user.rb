FactoryGirl.define do
  factory :applicant_user, class: User do
    name      "John Doe"
    username  "JDoe"
    email     "johndoe@example.com"
    location "denver"
    password  "password"
    role      0
  end

  factory :business_user, class: User do
    name      "Janet Does"
    username  "JanetDoes"
    email     "janetdoes@example.com"
    location  "denver"
    password  "password"
    role      1
  end

  factory :super_user, class: User do
    name      "Jane Doe"
    username  "JaneDoe"
    email     "janedoe@example.com"
    location "denver"
    password  "password"
    role      2
  end

end
