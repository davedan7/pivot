class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_job(job_id)
    contents[job_id.to_s] ||= 0
    contents[job_id.to_s] += 1
  end

  def count_of(job_id)
    contents[job_id.to_s]
  end

  def count_all
    contents.values.sum
  end

  def quantity(job_id)
    contents[job_id]
  end

  def increase_quantity(job_id)
    contents[job_id] += 1
  end

  def decrease_quantity(job_id)
    contents[job_id] -= 1 if contents[job_id] > 0
  end

  def find_jobs
    contents.keys.map { |job_id| job.find(job_id)}
  end

  def find_valid_jobs
    jobs = subtotal.reject { |_id, total| total == 0}
    jobs.keys.map { |job_id| job.find(job_id)}
  end

  def subtotal
    find_jobs.each_with_object({}) do |job, hash|
      hash[job.id] = quantity(job.id.to_s) * job.price
    end
  end

  def total
    subtotal.values.sum
  end

  def remove_job(job_id)
    contents.delete(job_id)
  end

  def create_order_jobs(order_id)
    contents.find_jobs.each do
      OrderJobs.new()
    end
  end

  def clear
    contents.clear
  end
end
