FactoryGirl.define do
  factory :category, class: Category do
    name          "main course"
    description   "for main course jobs"
  end

  factory :category1, class: Category do
    name          "drinks"
    description   "different kinds"
  end

  factory :category2, class: Category do
    name          "curries"
    description   "spicy"
  end

  factory :category3, class: Category do
    name        "breakfast"
    description "before noon"
  end
end
