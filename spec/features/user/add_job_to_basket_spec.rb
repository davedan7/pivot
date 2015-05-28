require "rails_helper"

RSpec.describe "applying for a job" do

  it "adds job to basket" do
    business = create(:business_user)
    job = Job.create(title: "engineer", description: "ruby job", posting_cost: 10, user_id: business.id)
    user = create(:applicant_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit businesses_path
    click_link "JanetDoes"
    expect(current_path).to eq('/janetdoes/jobs')
    expect(page).to have_content("engineer")
    click_link_or_button "engineer"
    click_link_or_button "Apply to Job"
    expect(page).to have_content("You have added the job, engineer, to your basket.")
  end

  it "gives error message when checking out if basket empty" do
    user = create(:applicant_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit checkout_path
    click_link_or_button "Submit Resume(s)"

    expect(page).to have_content("Your basket can't be empty!")
  end

  it "can remove job" do
    business = create(:business_user)
    job = Job.create(title: "engineer", description: "ruby job", posting_cost: 10, user_id: business.id)
    user = create(:applicant_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit businesses_path
    click_link "JanetDoes"
    expect(current_path).to eq('/janetdoes/jobs')
    expect(page).to have_content("engineer")
    click_link_or_button "engineer"
    click_link_or_button "Apply to Job"
    expect(page).to have_content("You have added the job, engineer, to your basket.")

    visit checkout_path

    click_link_or_button "Remove"

    expect(page).to_not have_content("engineer")
  end

  it "cannot add retired job to basked" do
    business = create(:business_user)
    job = Job.create(title: "engineer", description: "ruby job", posting_cost: 10, user_id: business.id, status: false)
    user = create(:applicant_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit businesses_path
    click_link "JanetDoes"
    expect(current_path).to eq('/janetdoes/jobs')
    expect(page).to have_content("engineer")
    click_link_or_button "engineer"
    click_link_or_button "Apply to Job"
    expect(page).to have_content("Retired job cannot be added to cart")
  end
end
