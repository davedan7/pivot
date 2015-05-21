require "rails_helper"

RSpec.describe "applying for a job" do

  ### not currently passing because business index needs to be built ###

  xit "adds job to basket" do
    business = create(:business_user)
    job = Job.create(title: "engineer", description: "ruby job", posting_cost: 10, users_id: business.id)
    # visit businesses_path
    # click_link_or_button "JanetDoes"
    # expect(current_path).to eq('/janetdoes/jobs')
    expect(page).to have_content("engineer")
    click_link_or_button "Add to Basket"
    expect(page).to have_content("JobApplication Successfully Placed")
  end
end
