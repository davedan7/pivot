FactoryGirl.define do
  factory :job do
    title "engineer"
    description "so hard"
    posting_cost 10


    # factory :item_with_categories do
    #    after(:create) do |item, evaluator|
    #     category = create(:category)
    #     item.item_categories.create(category: category)
    #   end
    # end
  end
end
