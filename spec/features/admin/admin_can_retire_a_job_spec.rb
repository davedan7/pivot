require "rails_helper"

RSpec.describe "admin capabilities" do
  context "as admin" do
    xit "can retire an job" do
      5.times do |x|
        create(:job, title: "Job#{x}")
      end

      admin = create(:super_user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path
      within(".admin-links") do
        click_link "All Jobs"
      end
      ###fails because there isn't an all jobs link###

      expect(current_path).to eq(admin_jobs_path)

      click_link "Job1"
      click_link "Edit"

      page.choose "job[status]", match: :first
      click_button "Submit Job"

      expect(page).to have_content("retired")
    end
  end
end
