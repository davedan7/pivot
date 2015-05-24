require "rails_helper"

RSpec.describe "admin page" do
 it "shows the status selected" do

   admin = create(:super_user)
   business = create(:business_user)
   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

   5.times do |x|
     create(:job, title: "job#{x}", user_id: business.id)
   end

   visit jobs_path
   click_link "job1"
   first(:button, "Apply to Job").click

   visit jobs_path
   click_link "job2"
   first(:button, "Apply to Job").click

   visit checkout_path

   click_button "Checkout"
   click_button "YES"

   visit admin_job_applications_dashboard_path
   select("processing", from: "order[filter_status]")

   expect(page).to have_content(10)
 end
end
