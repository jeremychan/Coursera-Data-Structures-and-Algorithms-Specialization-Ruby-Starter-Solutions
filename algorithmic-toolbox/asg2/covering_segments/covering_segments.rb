Segment = Struct.new("Segment", :start, :end)

def optimal_points(segments)
  # write your code here
end

if __FILE__ == $0
  data = STDIN.read.split.map(&:to_i)
  n = data[0]
  segments = data[1..2*n].each_slice(2).to_a.map { |e| Segment.new(e[0], e[1]) }
  points = optimal_points(segments)
  puts "#{points.size}"
  puts "#{points.join(' ')}"
end