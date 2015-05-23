require "rails_helper"

RSpec.describe "admin page" do
 xit "shows the status selected" do

   admin = create(:super_user)
   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

   5.times do |x|
     create(:job, title: "job#{x}")
   end

   visit jobs_path
   click_link "job1"
   ###failure here because there isn't a job show page yet ###
   first(:button, "Add To Basket").click

   visit jobs_path
   click_link "job2"
   first(:button, "Add To Basket").click

   visit checkout_path

   click_button "Checkout"
   click_button "Confirm"

   visit admin_orders_dashboard_path
   select("processing", from: "order[filter_status]")

   expect(page).to have_content(10)
 end
end
