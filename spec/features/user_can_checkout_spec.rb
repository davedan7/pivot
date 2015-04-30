require "rails_helper"

RSpec.describe "user checkout" do
  context "authenticated user" do

    it "can checkout" do
      user = create(:default_user)
      5.times do |x|
        create(:item, title: "item#{x}")
      end

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit items_path
      click_link "item1"
      first(:button, "Add To Cart").click

      visit checkout_path

      click_button "Checkout"

      expect(page).to have_content("item1")
      expect(page).to have_content("Confirm Order")

      click_button "Confirm Order"
      expect(page).to have_content("Dashboard")
    end
  end
end
