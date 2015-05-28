require 'rails_helper'

RSpec.describe "As a business user" do
  it "can edit jobs" do
    business_admin = create(:business_admin_user)
    job = create(:job, title: "Engineer", description: "something", user_id: business_admin.id)
    5.times do |x|
      User.create(id: x, name: "business", role: 1, username: "user#{x}", email: "user#{x}@example.com", password: "password", location: "Denver")
    end

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(business_admin)

    visit business_dashboard_path(business: (User.find(business_admin.employer_id)).slug)
    click_button "Manage your Job Postings"
    click_link_or_button "Engineer"
    click_link_or_button "Edit"
    fill_in "job[title]", with: "new title"
    click_button "Submit"

    expect(page).to have_content("new title")
  end
end
