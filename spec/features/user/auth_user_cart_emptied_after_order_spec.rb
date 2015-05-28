require "rails_helper"

RSpec.describe "Cart after Submit Resume(s)" do
  it "cart is cleared after Submit Resume(s)" do
      user = create(:applicant_user)
      5.times do |x|
        create(:job, title: "job#{x}", user_id: user.id)
      end
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit jobs_path
      click_link "job1"
      first(:button, "Add Job to Basket").click
      visit checkout_path
      expect(page).to have_content("job1")
      click_button "Submit Resume(s)"
      click_button "YES"

      visit checkout_path
      expect(page).to_not have_content("job1")
  end

  it "all jobs are cleared after Submit Resume(s)" do
      user = create(:applicant_user)
      5.times do |x|
        create(:job, title: "job#{x}", user_id: user.id)
      end
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit jobs_path
      click_link "job1"
      first(:button, "Add Job to Basket").click
      visit jobs_path
      click_link "job2"
      first(:button, "Add Job to Basket").click
      visit jobs_path
      click_link "job3"
      first(:button, "Add Job to Basket").click
      visit checkout_path
      expect(page).to have_content("job1")
      click_button "Submit Resume(s)"
      click_button "YES"

      visit checkout_path
      expect(page).to_not have_content("job1")
      expect(page).to_not have_content("job2")
      expect(page).to_not have_content("job3")
    end
end
