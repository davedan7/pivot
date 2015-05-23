require "rails_helper"

RSpec.describe "Admin" do
  context "when visiting the job applications page" do

    xit "can see all applications" do
      admin = create(:super_user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      5.times do |x|
        create(:job, title: "job#{x}")
      end

      visit jobs_path
      click_link "job1"
      ###fails because there is no job show page yet###
      first(:button, "Add To Basket").click

      visit jobs_path
      click_link "job2"
      first(:button, "Add To Basket").click

      visit checkout_path

      click_button "Checkout"
      click_button "Confirm"

      visit admin_orders_dashboard_path
      expect(page).to have_content("Order Dashboard")
      expect(page).to have_content("Job_application_id")
      expect(page).to have_content("User_id")
      expect(page).to have_content("submitted")
      expect(page).to have_content("processing")
      expect(page).to have_content("processed")
    end
  end
end
