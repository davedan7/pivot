require 'rails_helper'

RSpec.describe "Users" do
  context "logged in as business" do
    it "can add jobs" do
      business_admin = User.create(name: "Sam the Admin", email: "sam@turing.io", username: "sam", password: "password", role: 3, location: "Denver", description: "I teach teh Javascripts!", employer: User.find_by(username: 'turing'))
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(business_admin)

      visit new_business_job_path(business: business_admin.employer.slug)
      fill_in "job[title]", with: "TestTitle"
      fill_in "job[description]", with: "TestDescription"
      click_link_or_button "Submit"
      visit jobs_path
      expect(page).to have_content("TestTitle")
      expect(page).to have_content("TestDescription")
    end
  end
end
