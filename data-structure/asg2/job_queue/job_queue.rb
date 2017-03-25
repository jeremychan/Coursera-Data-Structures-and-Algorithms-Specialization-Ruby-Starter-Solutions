class JobQueue

  attr_accessor :n, :m, :jobs

  def read_data
    inputs = STDIN.read.split.map { |x| x.to_i }
    @n, @m = inputs[0], inputs[1]
    @jobs = inputs[2..-1]
  end

  def write_response
    (0..@m-1).each { |i|
      puts "#{@assigned_workers[i]} #{@start_times[i]}"
    }
  end

  def assign_jobs
    @assigned_workers = Array.new(@m)
    @start_times = Array.new(@m)
    # write your code here
  end

  def solve
    read_data
    assign_jobs
    write_response
  end
end

if __FILE__ == $0
  job_queue = JobQueue.new
  job_queue.solve
end