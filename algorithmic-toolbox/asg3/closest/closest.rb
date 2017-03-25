Point = Struct.new("Point", :x, :y) do
  def to_s
    "(#{x}, #{y})"
  end

  def distance_from(p)
    Math.sqrt((x-p[:x])**2 + (y-p[:y])**2)
  end
end

def get_points(x, y)
  points = []
  (0..x.length-1).each { |i|
    points.push(Point.new(x[i], y[i]))
  }
  points
end

def minimum_distance(x, y)
  points = get_points(x, y)
  # write your code here - preprocess points
  find_min(points)
end

def find_min(points)
  # write your code here
end

def minimum_distance_naive(x, y)
  points = get_points(x, y)
  min = -1
  points.each { |i|
    points.each { |j|
      if i != j
        dist = i.distance_from(j)
        min = dist if dist < min || min == -1
      end
    }
  }
  min
end

if __FILE__ == $0
  data = STDIN.read.split.map(&:to_i)
  n = data.size - 1
  x = (1..n).step(2).map { |i| data[i] }
  y = (2..n).step(2).map { |i| data[i] }
  puts "#{'%.4f' % minimum_distance(x, y)}"
end