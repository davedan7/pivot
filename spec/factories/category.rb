FactoryGirl.define do
  factory :category, class: Category do
    name          "Ruby"
    description   "for main course jobs"
  end

  factory :category1, class: Category do
    name          "Javascript"
    description   "different kinds"
  end

  factory :category2, class: Category do
    name          "Administration"
    description   "spicy"
  end

  factory :category3, class: Category do
    name        "C##"
    description "before noon"
  end
end
