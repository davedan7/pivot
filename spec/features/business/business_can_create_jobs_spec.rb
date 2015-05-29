require 'rails_helper'

RSpec.describe "Users" do
  context "logged in as business" do
    it "can add jobs" do
      business = create(:business_user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(business)

      visit new_business_job_path(business: business.slug)
      fill_in "job[title]", with: "TestTitle"
      fill_in "job[description]", with: "TestDescription"
      click_link_or_button "Submit"
      visit jobs_path
      expect(page).to have_content("TestTitle")
      expect(page).to have_content("TestDescription")
    end
  end
end
