FactoryGirl.define do
  factory :job do
    title "engineer"
    description "so hard"
    posting_cost 10


    # factory :job_with_categories do
    #    after(:create) do |job, evaluator|
    #     category = create(:category)
    #     job.job_categories.create(category: category)
    #   end
    # end
  end
end
