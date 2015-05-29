require "rails_helper"

RSpec.describe "Admin" do
  context "when visiting the job applications page" do

    it "can see all applications" do
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

      click_button "Submit"
      click_button "YES"

      visit admin_job_applications_dashboard_path
      expect(page).to have_content("Application Dashboard")
      expect(page).to have_content("Application_id")
      expect(page).to have_content("User_id")
      expect(page).to have_content("Received")
      expect(page).to have_content("Accepted")
      expect(page).to have_content("Rejected")
    end
  end
end
