require 'rails_helper'

RSpec.describe "business admin" do
  it "cannot delete business" do
    business_user = create(:business_admin_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(business_user)

    visit user_path(business_user)

    click_link_or_button "Delete Account"

    expect(page).to have_content("You do not have the required permissions to delete this account")
  end
end
