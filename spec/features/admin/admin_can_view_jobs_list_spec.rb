require "rails_helper"

RSpec.describe "admin jobs" do
  context "when logged in as admin" do
    it "can view list of jobs" do
      business = create(:business_user)
      5.times do |x|
        create(:job, title: "Job#{x}", user_id: business.id)
      end

      admin = create(:super_user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path

      within(".admin-links") do
        click_link "All Jobs"
      end

      expect(current_path).to eq(admin_jobs_path)
      expect(page).to have_content("Job0")
      expect(page).to have_content("Job4")
      expect(page).to have_content("Job3")
      expect(page).to have_content("Job2")
      expect(page).to have_content("Job1")
    end
  end
end
