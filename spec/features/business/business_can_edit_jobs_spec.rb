require 'rails_helper'

RSpec.describe "As a business user" do
  it "can edit jobs" do
    business = User.create(name: "janety does", username: "JanetyDoes", email: "JanetyDoes@example.com", role: 1, password: "password", location: "Denver")
    business.employer_id = business.id
    job = create(:job, title: "Engineer", description: "something", user_id: business.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(business)

    visit business_dashboard_path(business: business.slug)

    click_button "Manage your Job Postings"
    expect(current_path).to eq(business_jobs_path(business: business.slug))
    click_link_or_button "Engineer"
    expect(current_path).to eq(job_path(id: job.id))
    click_link_or_button "Edit"
    fill_in "job[title]", with: "new title"
    click_button "Submit"

    expect(page).to have_content("new title")
  end
end
