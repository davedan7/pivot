require "rails_helper"

RSpec.describe "Business User" do
  context "when viewing jobs" do
    xit "can change status of an individual job" do

      admin = create(:super_user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      5.times do |x|
        create(:job, title: "job#{x}")
      end

      visit jobs_path
      click_link "job1"
      first(:button, "Add To Basket").click

      visit jobs_path
      click_link "job2"
      first(:button, "Add To Basket").click

      visit checkout_path

      click_button "Checkout"
      click_button "Yes"

      visit admin_orders_dashboard_path

      first(:link, 1).click
      click_link("Processing")

      expect(page).to have_content("Current Status: processing")
    end
  end
end
