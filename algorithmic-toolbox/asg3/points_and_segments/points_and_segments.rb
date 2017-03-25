Segment = Struct.new("Segment", :a, :b) do
  def contains?(point)
    a <= point and point <= b
  end

  def to_s
    "(#{a}, #{b})"
  end
end

def fast_count_segments(segments, points)
  # write your code here
end

def naive_count_segments(segments, points)
  points.map { |point| segments.count { |s| s.contains?(point) } }
end

if __FILE__ == $0
  data = STDIN.read.split.map(&:to_i)
  s, p = data[0], data[1]
  segments = data[2..2*s+1].each_slice(2).to_a.map { |e| Segment.new(e[0], e[1]) }
  points = data[2*s+2..-1]
  puts fast_count_segments(segments, points).join(' ')
end

