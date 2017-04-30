class Vertex
  include Comparable
  attr_accessor :id, :adj, :state, :dist

  def initialize(id)
    @id = id
    @adj = []
    @state = :unvisited
    @dist = -1
  end

  def to_s
    "#{id + 1}"
  end

  def <=>(other)
    other.dist <=> @dist
  end

  def add_adj(id, w)
    edge = Edge.new(@id, id, w)
    @adj.push(edge)
    edge
  end
end

class Edge
  attr_accessor :to, :from, :w

  def initialize(from, to, w)
    @to = to
    @w = w
    @from = from
  end
end

class Graph
  def initialize(n)
    @vertexes = Array.new(n) {|i| Vertex.new(i)}
    @edges = []
  end

  def add_edge(u, v, w)
    edge = @vertexes[u].add_adj(v, w)
    @edges.push(edge)
  end

  def shortest_paths(s)
    @vertexes.each {|v|
      puts "0"
    }
  end
end

if __FILE__ == $0
  n, m = STDIN.gets.split.map(&:to_i)
  graph = Graph.new(n)
  (0...m).each {
    u, v, w = STDIN.gets.split
    graph.add_edge(u.to_i - 1, v.to_i - 1, w.to_i)
  }
  s = STDIN.gets.to_i
  graph.shortest_paths(s)
end