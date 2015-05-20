class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true

  has_many :job_categories
  has_many :jobs, through: :job_categories

  extend FriendlyId
  friendly_id :name, use: :slugged

  def can_destroy?
    jobs.count < 1
  end
end
