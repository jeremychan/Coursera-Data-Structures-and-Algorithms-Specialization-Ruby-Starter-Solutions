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

class Maze
  def initialize(n)
    @vertexes = Array.new(n) { |i| Vertex.new(i) }
  end

  def add_edge(u, v)
    @vertexes[u].add_adj(v)
    @vertexes[v].add_adj(u)
  end

  def connected?(u, v)
    # write code here
    0
  end
end

if __FILE__ == $0
  n, m = STDIN.gets.split.map(&:to_i)
  maze = Maze.new(n)
  (0...m).each {
    u, v = STDIN.gets.split.map { |x| x.to_i-1 }
    maze.add_edge(u, v)
  }
  u, v = STDIN.gets.split.map { |x| x.to_i-1 }
  puts "#{maze.connected?(u, v)}"
end