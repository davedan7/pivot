require 'rails_helper'

describe JobApplication do
  it {should validate_presence_of(:user_id)}
  it {should validate_presence_of(:status)}
end
