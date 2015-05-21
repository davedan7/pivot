class ChangeJobsIdToJobIdJobApplicationsTable < ActiveRecord::Migration
  def change
    rename_column :job_applications, :jobs_id, :job_id
  end
end
