
###these do not pass because there is no add job link on the admin dashboard page

require "rails_helper"

RSpec.describe "Admin jobs" do

  context "as an admin" do
    it "can create a new job" do
      admin = create(:super_user)
      business = create(:business_user)
      category = create(:category)
      category1 = create(:category1)
      category2 = create(:category2)
      category3 = create(:category3)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path
      click_link "Add New Job"

      expect(current_path).to eq(new_admin_job_path)

      fill_in "Job title", with: "New Job"
      fill_in "Job description", with: "New Description"
      fill_in "Posting cost", with: 10
      select "JanetDoes", from: "job[user_id]"
      check "Ruby"
      click_button "Submit Job"
      expect(page).to have_content("New Job")
      expect(page).to have_content("New Description")
      visit admin_jobs_path

      expect(page).to have_content("New Job")
    end

    it "cannot create a new job with empty title" do
      admin = create(:super_user)
      business = create(:business_user)
      category = create(:category)
      category1 = create(:category1)
      category2 = create(:category2)
      category3 = create(:category3)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path
      click_link "Add New Job"

      expect(current_path).to eq(new_admin_job_path)

      fill_in "Job title", with: ""
      fill_in "Job description", with: "New Description"
      fill_in "Posting cost", with: 10
      select "JanetDoes", from: "job[user_id]"
      page.check "Ruby"
      click_button "Submit Job"

      expect(page).to have_content("Title can't be blank")
    end

    it "can not create the same job twice" do
      admin = create(:super_user)
      business = create(:business_user)
      category = create(:category)
      category1 = create(:category1)
      category2 = create(:category2)
      category3 = create(:category3)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path
      click_link "Add New Job"

      expect(current_path).to eq(new_admin_job_path)

      fill_in "Job title", with: "New Job"
      fill_in "Job description", with: "New Description"
      fill_in "Posting cost", with: 10
      select "JanetDoes", from: "job[user_id]"
      check "Ruby"
      click_button "Submit Job"

      visit admin_dashboard_path
      click_link "Add New Job"

      expect(current_path).to eq(new_admin_job_path)

      fill_in "Job title", with: "New Job"
      fill_in "Job description", with: "New Description"
      fill_in "Posting cost", with: 10
      click_button "Submit Job"

      expect(page).to have_content("Title has already been taken")
    end

    it "can not create the same job twice" do
      admin = create(:super_user)
      business = create(:business_user)
      category = create(:category)
      category1 = create(:category1)
      category2 = create(:category2)
      category3 = create(:category3)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path
      click_link "Add New Job"

      expect(current_path).to eq(new_admin_job_path)

      fill_in "Job title", with: "New Job"
      fill_in "Job description", with: "New Description"
      fill_in "Posting cost", with: 10
      select "JanetDoes", from: "job[user_id]"
      check "Ruby"
      click_button "Submit Job"

      visit admin_dashboard_path
      click_link "Add New Job"

      expect(current_path).to eq(new_admin_job_path)

      fill_in "Job title", with: "New Job"
      fill_in "Job description", with: "New Description"
      fill_in "Posting cost", with: 10
      click_button "Submit Job"

      expect(page).to have_content("Title has already been taken")
    end
  end
end
