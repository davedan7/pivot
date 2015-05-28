require "rails_helper"

RSpec.describe "Business User" do
  context "when viewing jobs" do
    it "can change status of an individual job" do

      admin = create(:super_user)
      business = create(:business_user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      5.times do |x|
        create(:job, title: "job#{x}", user_id: business.id)
      end

      visit jobs_path
      click_link "job1"
      first(:button, "Add Job to Basket").click

      visit jobs_path
      click_link "job2"
      first(:button, "Add Job to Basket").click

      visit checkout_path

      click_button "Submit Resume(s)"
      click_button "YES"

      visit admin_job_applications_dashboard_path

      first(:link, 1).click
      expect(page).to have_content("received")

      click_link("Processing")


      expect(page).to have_content("Current Status: processing")
    end
  end
end
