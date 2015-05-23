class Cart
  attr_reader :contents, :flash_type, :flash_message

  def initialize(initial_contents)
    @contents = initial_contents || []
    @flash_type = ""
    @flash_message = ""
  end

  def add_job(job_id)
    if contents.include?(job_id)
      flash_type    = "danger"
      flash_message = "This job is already in your basket!"
    else
      contents << job_id
      flash_type = "success"
      flash_message = "You have added the job, #{Job.find(job_id).title}, to your basket."
    end
  end

  # def count_of(job_id)
  #   contents[job_id.to_s].values.sum
  # end

  def count_all
    contents.length
  end

  # def quantity(job_id)
  #   contents[job_id]
  # end

  # def increase_quantity(job_id)
  #   contents[job_id] += 1
  # end
  #
  # def decrease_quantity(job_id)
  #   contents[job_id] -= 1 if contents[job_id] > 0
  # end

  def find_jobs
    contents.map { |job_id| Job.find(job_id)}
  end

  # def find_valid_jobs
  #   jobs = subtotal.reject { |job_id, total| total == 0}
  #   jobs.keys.map { |job_id| job.find(job_id)}
  # end

  #
  # def subtotal
  #   find_jobs.each_with_object({}) do |job, hash|
  #     hash[job.id] = quantity(job.id.to_s) * job.price
  #   end
  # end

  # def total
  #   subtotal.values.sum
  # end

  def remove_job(job_id)
    contents.delete(job_id)
  end

  # def create_order_jobs(order_id)
  #   contents.find_jobs.each do
  #     OrderJobs.new()
  #   end
  # end

  def clear
    contents.clear
  end
end
