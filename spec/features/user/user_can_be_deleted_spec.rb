require "rails_helper"

RSpec.describe "User view" do
  context 'with valid attributes' do


    it 'cant destroy itself' do
      user = create(:applicant_user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)
      click_button "Delete Account"

      expect(page).to have_content("permission")
    end

  end
end
