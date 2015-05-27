require 'rails_helper'

RSpec.describe "Users" do
  context "logged in as business" do
    it "can add jobs" do
      business_admin = create(:business_admin_user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(business_admin)

      visit new_business_job_path(business: (User.find(business_admin.employer_id)).slug)

      fill_in "job[title]", with: "TestTitle"
      fill_in "job[description]", with: "TestDescription"
      click_link_or_button "Submit"

      expect(current_path).to eq(business_jobs_path(business: (User.find(business_admin.employer_id)).slug))
      expect(page).to have_content("TestTitle")
      expect(page).to have_content("TestDescription")
    end
  end
end


# require 'rails_helper'
#
# RSpec.describe "As a business user" do
#   it "can edit jobs" do
#     business_admin = create(:business_admin_user)
#     job = create(:job, title: "Engineer", description: "something", user_id: business_admin.id)
#
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(business_admin)
#
#     visit business_dashboard_path(business_admin.employer_id)
#     click_button "Manage your Job Postings"
#     expect(current_path).to eq(business_jobs_path(business: (User.find(business_admin.employer_id)).slug))
#     click_link_or_button "Engineer"
#     expect(current_path).to eq(business_job_path(business: (User.find(business_admin.employer_id)).slug, id: job.id))
#     click_link_or_button "Edit"
#     fill_in "job[title]", with: "new title"
#     click_button "Submit"
#
#     expect(page).to have_content("new title")
#   end
# end
