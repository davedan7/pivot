require "rails_helper"

RSpec.describe "applying for a job" do

  it "adds job to basket" do
    business = create(:business_user)
    job = Job.create(title: "engineer", description: "ruby job", posting_cost: 10, user_id: business.id)
    visit businesses_path
    click_link "JanetDoes"
    expect(current_path).to eq('/janetdoes/jobs')
    expect(page).to have_content("engineer")
    click_link_or_button "Apply to Job"
    expect(page).to have_content("You have added the job, engineer, to your basket.")
  end
end
