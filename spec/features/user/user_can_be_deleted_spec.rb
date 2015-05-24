require "rails_helper"

RSpec.describe "User view" do
  context 'with valid attributes' do


    it 'can destroy user' do
      user = create(:applicant_user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)
      click_link_or_button "Delete"

      expect(page).to have_content("Account has been removed")
    end

  end
end
