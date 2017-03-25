class Request
  attr_accessor :arrival_time, :process_time

  def initialize(arrival_time, process_time)
    @arrival_time = arrival_time
    @process_time = process_time
  end
end

class Response
  attr_accessor :dropped, :start_time

  def initialize(dropped, start_time)
    @dropped = dropped
    @start_time = start_time
  end
end

class Buffer
  attr_accessor :size

  def initialize(size)
    @size = size
    @finish_time = Array.new
  end

  def process(request)
    # write your code here

    # default response
    Response.new(false, start_time)
  end
end

def read_requests(count, inputs)
  requests = []
  (0..count-1).each { |i|
    arrival_time, process_time = inputs[i*2], inputs[i*2+1]
    requests.push(Request.new(arrival_time, process_time))
  }
  requests
end

def process_requests(requests, buffer)
  responses = []
  requests.each { |request|
    responses.push(buffer.process(request))
  }
  responses
end

def print_responses(responses)
  responses.each { |response|
    if !response.dropped
      puts "#{response.start_time}"
    else
      puts "-1"
    end
  }
end

if __FILE__ == $0
  input = STDIN.read.split().map { |x| x.to_i }
  size, count = input[0], input[1]
  requests = read_requests(count, input[2..-1])

  buffer = Buffer.new(size)
  responses = process_requests(requests, buffer)

  print_responses(responses)
end
