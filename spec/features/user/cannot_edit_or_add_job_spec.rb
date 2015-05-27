require 'rails_helper'

RSpec.describe "non admin users" do
  it "cannot create job postings" do
    user = create(:applicant_user)
    business = create(:business_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_business_job_path(business)

    expect(page).to have_content("404")
  end

  it "cannot edit job postings" do
    user = create(:applicant_user)
    business = create(:business_user)
    job = create(:job)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_business_job_path(business, job)

    expect(page).to have_content("404")
  end
end
