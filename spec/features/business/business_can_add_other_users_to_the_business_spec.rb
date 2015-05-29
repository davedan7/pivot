require 'rails_helper'

RSpec.describe "Adding a business administrator" do
  context "as the main business owner" do
    it "can add other users to manage the business" do
      business = create(:business_user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(business)

      visit new_business_administrative_management_path(business: business.slug)

      # expect(current_path).to eq(business_administrative_management_index_path(business: business.slug))
# save_and_open_page
      # click_link_or_button "Add New Administrator"

      # expect(current_path).to eq(new_business_administrative_management_path(business: business.slug))

      fill_in "Name", with: "Michelle Golle"
      fill_in "Username", with: "mg"
      fill_in "Email", with: "michelle@example.com"
      fill_in "Title", with: "Bus ad"
      fill_in "Location", with: "denver"
      fill_in "user[password]", with: "password"
      click_link_or_button "Create my account"

#### new bus admin does not show up on index page in test, working in development though ####

      expect(page).to have_content("Michelle Golle")

    end
  end
end
