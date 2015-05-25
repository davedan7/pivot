class Job < ActiveRecord::Base

  validates :title,        presence: true, uniqueness: true
  validates :description,  presence: true
  # validates :posting_cost, numericality: { greater_than: 0 }

  has_many :job_categories
  has_many :categories, through: :job_categories
  has_many :job_applications
  belongs_to :user

  scope :active, -> { where(status: true) }


  def show_status
    if status == true
      "active"
    else
      "retired"
    end
  end

  def retired
    status == false
  end

  def active
    status == true
  end

  def unique_categories
    errors.add :base, "job already belongs to that category" if categories.each { |category| categories.include?(category) }
  end

  def modify_status(status_param)
    if status_param == "false"
      status = false
    else
      status = true
    end
  end
end
