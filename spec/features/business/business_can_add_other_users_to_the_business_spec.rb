require 'rails_helper'

RSpec.describe "Adding a business administrator" do
  context "as the main business owner" do
    it "can add other users to manage the business" do
      business = create(:business_user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(business)

      visit business_dashboard_path

      click_link_or_button "Manage your administrators"

      expect(current_path).to eq(business_administrative_management_index_path(business: business.slug))

      click_link_or_button "Add New Administrator"

      expect(current_path).to eq(new_business_administrative_management_path)

      fill_in "Email", with: "johnsmith@example.com"
      fill_in "Title", with: "Business manager"
      click_link_or_button "Submit"

      expect(current_path).to eq(business_administrative_management_path)
      expect(page).to have_content("John Smith")
      expect(page).to have_content("Business manager")
      expect(page).to have_content("johnsmith@example.com")

    end
  end
end
