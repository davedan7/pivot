require 'rails_helper'

describe JobCategory do
  it { should validate_presence_of :category_id}
  it { should validate_presence_of :job_id}
end
