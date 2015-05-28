class JobApplication < ActiveRecord::Base

  before_update :check_application_status_changed

  belongs_to :user
  belongs_to :job

  validates :user_id, presence: true
  validates :status, presence: true
  validates :job_id, presence: true

  enum status: %w(received accepted rejected )

  default_scope { order(created_at: :desc) }

  def self.number_currently_received
    received.count
  end

  def self.number_currently_accepted
    accepted.count
  end

  def self.number_currently_rejected
    rejected.count
  end

  def date_applied(application_created_at)
    application_created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def date_created
    created_at.strftime(" %d %b %Y %l:%M %p")
  end

  def date_updated
    updated_at.strftime(" %d %b %Y %l:%M %p")
  end

  def show_status
    if status == "received"
      status
    else
      "#{status} -  updated on: #{self.updated_at.strftime("%A, %d %b %Y %l:%M %p")}"
    end
  end

  def job_title
    Job.find_by(id: job_id).title
  end

  def user
    User.find_by(id: user_id)
  end

  private

  def check_application_status_changed
    UserNotifier.job_application_status_changed(self.user_id, show_status).deliver_now if self.status_changed?
  end
end
