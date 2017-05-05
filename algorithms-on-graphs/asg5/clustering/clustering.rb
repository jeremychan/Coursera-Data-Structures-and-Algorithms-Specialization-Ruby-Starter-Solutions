class Vertex
  attr_accessor :id, :x, :y

  def initialize(id)
    @id = id
  end

  def to_s
    "#{id + 1}"
  end
end

class Graph
  def initialize(n)
    @vertexes = Array.new(n) {|i| Vertex.new(i)}
  end

  def add_point(i, x, y)
    v = @vertexes[i]
    v.x, v.y = x, y
  end

  def clustering(k)
    0
  end
end

if __FILE__ == $0
  n = STDIN.gets.to_i
  graph = Graph.new(n)
  (0...n).each { |i|
    x, y = STDIN.gets.split.map(&:to_i)
    graph.add_point(i, x, y)
  }
  k = STDIN.gets.to_i
  puts "#{graph.clustering(k)}"
end