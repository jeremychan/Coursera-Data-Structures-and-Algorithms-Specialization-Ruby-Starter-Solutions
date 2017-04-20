class Vertex
  attr_accessor :id, :adj

  def initialize(id)
    @id = id
    @adj = []
  end

  def add_adj(id)
    @adj.push(id)
  end
end

class Graph
  def initialize(n)
    @vertexes = Array.new(n) { |i| Vertex.new(i) }
  end

  def add_edge(u, v)
    @vertexes[u].add_adj(v)
    @vertexes[v].add_adj(u)
  end

  def shortest_path(src, dest)
    # code here
    0
  end
end

if __FILE__ == $0
  n, m = STDIN.gets.split.map(&:to_i)
  graph = Graph.new(n)
  (0...m).each {
    u, v = STDIN.gets.split.map { |x| x.to_i-1 }
    graph.add_edge(u, v)
  }
  src, dest = STDIN.gets.split.map { |x| x.to_i-1 }
  puts "#{graph.shortest_path(src, dest)}"
end