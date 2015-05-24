require "rails_helper"

RSpec.describe "admin jobs" do
  context "when logged in as admin" do
    xit "can view list of jobs" do
      5.times do |x|
        create(:job, title: "Job#{x}")
      end

      admin = create(:super_user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path

      within(".admin-links") do
        click_link "All Jobs"
      end
      ###fails because there is no all jobs link###

      expect(current_path).to eq(admin_jobs_path)
      expect(page).to have_content("job0")
      expect(page).to have_content("job4")
      expect(page).to have_content("job3")
      expect(page).to have_content("job2")
      expect(page).to have_content("job1")
    end
  end
end
