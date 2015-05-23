require "rails_helper"

RSpec.describe "admin can not access other users" do
  it "cannot modify or access" do
    admin = create(:super_user)
    user = create(:applicant_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit user_path(user)
    expect(page).to_not have_content("JohnDoe Dashboard")
    expect(page).to have_content("Jane Doe Dashboard")
  end
end
