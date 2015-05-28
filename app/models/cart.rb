class Cart
  attr_reader :contents, :flash_type, :flash_message

  def initialize(initial_contents)
    @contents = initial_contents || {}
    @flash_type = ""
    @flash_message = ""
  end

  def add_job(job_id)
    if contents.include?(job_id.to_s)
      @flash_type    = "danger"
      @flash_message = "This job is already in your basket!"
    else
      contents[job_id] = "none"
      @flash_type = "success"
      @flash_message = "You have added the job, #{Job.find(job_id).title}, to your basket."
    end
  end

  def add_resume(resume)
    contents.keys.each do |job_id|
      contents[job_id] = resume
    end
  end

  def count_all
    contents.keys.count
  end

  def find_jobs
    contents.keys.map { |job_id| Job.find(job_id)}
  end

  def remove_job(job_id)
    contents.delete(job_id)
  end

  def clear
    contents.clear
  end
end
