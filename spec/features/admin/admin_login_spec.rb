require 'rails_helper'

RSpec.describe "Admin login" do
  context "with valid attributes" do
    it "is taken to admin dashboard" do
      admin = create(:super_user)

      visit login_path
      fill_in "Email", with: "janedoe@example.com"
      fill_in "Password", with: "password"
      click_button "Login"

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content("Admin Dashboard - Welcome Jane Doe!")
    end
  end

  context "with valid default user attributes" do
    it "is not taken to admin dashboard" do
      user = create(:applicant_user)

      visit login_path
      fill_in "Email", with: "JDoe"
      fill_in "user[password]", with: "password"

        click_link_or_button "Login"

      expect(current_path).not_to eq(admin_dashboard_path)
      visit admin_dashboard_path

      expect(page).to have_content("404")
    end
  end
end
