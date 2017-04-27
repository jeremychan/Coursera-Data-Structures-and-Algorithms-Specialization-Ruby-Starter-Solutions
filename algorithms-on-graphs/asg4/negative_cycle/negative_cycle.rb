class Vertex
  attr_accessor :id, :adj

  def initialize(id)
    @id = id
    @adj = []
  end

  def add_adj(id, w)
    @adj.push(Edge.new(id, w))
  end
end

class Edge
  attr_accessor :to, :w

  def initialize(to, w)
    @to = to
    @w = w
  end
end

class Graph
  def initialize(n)
    @vertexes = Array.new(n) { |i| Vertex.new(i) }
  end

  def add_edge(u, v, w)
    @vertexes[u].add_adj(v, w)
  end

  def negative_cycle?
    # code here
    0
  end
end

if __FILE__ == $0
  n, m = STDIN.gets.split.map(&:to_i)
  graph = Graph.new(n)
  (0...m).each {
    u, v, w = STDIN.gets.split
    graph.add_edge(u.to_i - 1, v.to_i - 1, w)
  }
  puts "#{graph.negative_cycle?}"
end