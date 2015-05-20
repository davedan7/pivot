require 'rails_helper'

RSpec.feature 'user authentication' do
  context 'a registered user' do
    let!(:business) {User.create(name: 'Turing School',
                                 username: 'turing',
                                 email: 'turing@turing.io',
                                 location: 'Denver',
                                 role: 1,
                                 password: 'password')}

    it 'shows the businesses' do
      visit businesses_path

      expect(page).to have_content("Invalid Credentials. Please Try Again.")
    end
  end
end