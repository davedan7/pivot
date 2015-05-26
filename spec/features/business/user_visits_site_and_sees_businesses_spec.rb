require 'rails_helper'

RSpec.feature 'user authentication' do

  context 'a registered user' do
    it 'shows the businesses' do
      bob = create(:applicant_user)
      business = create(:business_user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)
      visit businesses_path
      expect(current_path).to eq(businesses_path)
      expect(page).to have_content("JanetDoes")

    end
  end
end
