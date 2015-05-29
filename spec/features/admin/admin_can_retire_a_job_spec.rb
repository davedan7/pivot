require "rails_helper"

RSpec.describe "admin capabilities" do
  context "as admin" do
    it "can retire an job" do
      category = create(:category)
      business = create(:business_user)
        job = create(:job, title: "TestJob", user_id: business.id)
        category.jobs << job


      admin = create(:super_user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_jobs_path

      expect(current_path).to eq(admin_jobs_path)

      click_link_or_button "Edit"

      page.choose "job[status]", match: :first
      click_button "Submit Job"

      expect(page).to have_content("retired")
    end
  end
end
