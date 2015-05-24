require "rails_helper"

RSpec.describe "Cart after checkout" do
  it "cart is cleared after checkout" do
      user = create(:applicant_user)
      5.times do |x|
        create(:job, title: "job#{x}")
      end
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit jobs_path
      click_link "job1"
      first(:button, "Add To Cart").click
      visit checkout_path
      expect(page).to have_content("job1")
      click_button "Checkout"
      click_button "Confirm Order"

      visit checkout_path
      expect(page).to_not have_content("job1")
  end

  it "all jobs are cleared after checkout" do
      user = create(:applicant_user)
      5.times do |x|
        create(:job, title: "job#{x}")
      end
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit jobs_path
      click_link "job1"
      first(:button, "Add To Cart").click
      visit jobs_path
      click_link "job2"
      first(:button, "Add To Cart").click
      visit jobs_path
      click_link "job3"
      first(:button, "Add To Cart").click
      visit checkout_path
      expect(page).to have_content("job1")
      click_button "Checkout"
      click_button "Confirm Order"

      visit checkout_path
      expect(page).to_not have_content("job1") 
      expect(page).to_not have_content("job2")
      expect(page).to_not have_content("job3")
    end
end