class JobCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :job
  validates :job_id, presence: true
  validates :category_id, presence: true
end
