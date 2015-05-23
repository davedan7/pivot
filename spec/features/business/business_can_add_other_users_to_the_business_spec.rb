require 'rails_helper'

RSpec.describe "Adding a business administrator" do
  context "as the main business owner" do
    it "can add other users to manage the business" do
      business = create(:business_user)

      business_admin = create(:business_admin_user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(business)

      visit business_dashboard_path

      click_link_or_button "Manage your administrators"

      expect(current_path).to eq(business_administrative_management_index_path(business: business.slug))

      click_link_or_button "Add New Administrator"

      expect(current_path).to eq(add_business_admin_path(business: business.slug))

      fill_in "user[email]", with: business_admin.email
      fill_in "user[title]", with: "Business manager"
      click_link_or_button "Submit"

      expect(current_path).to eq(business_administrative_management_index_path(business: business.slug))
# save_and_open_page
      expect(page).to have_content("John Smith")
      expect(page).to have_content("Business manager")
      expect(page).to have_content("johnsmith@example.com")

    end
  end
end
