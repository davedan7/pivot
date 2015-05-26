require 'rails_helper'

RSpec.describe "As a business user" do
  it "can edit jobs" do
    business = create(:business_user)
    job = create(:job, title: "Engineer", description: "something", user_id: business.id)

    visit business_job_path(job)
    click_link "Edit"
    fill_in "job[title]", with: "new title"
    click_button "Submit"

    expect(page).to have_content("new title")
  end
end
