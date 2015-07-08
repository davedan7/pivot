require 'rails_helper'

RSpec.describe "business admin" do
  it "cannot delete business" do
    business = create(:business_user)
    business_user = create(:business_admin_user)
    business_user.employer = business
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(business_user)

    visit user_path(id: business_user.id)

    expect(page).to_not have_content("Delete Account")


  end
end
