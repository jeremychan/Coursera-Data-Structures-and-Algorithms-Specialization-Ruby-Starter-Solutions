class Vertex
  attr_accessor :id, :adj, :x, :y

  def initialize(id)
    @id = id
    @adj = []
  end

  def add_adj(edge)
    @adj.push(edge)
  end
end

class Edge
  attr_accessor :from, :to, :c

  def initialize(from, to, c)
    @from = from
    @to = to
    @c = c
  end

  def to_s
    "#{@from}->#{@to}:#{c}"
  end
end

class Trie
  attr_accessor :vertexes

  def initialize
    @vertexes = []
  end

  def << (patterns)

  end

  def match(text)

  end
end

if __FILE__ == $0
  text = STDIN.gets
  n = STDIN.gets.to_i
  trie = Trie.new
  (0...n).each {
    patterns = STDIN.gets.split('')
    trie << patterns
  }
  puts "#{trie.match(text)}"
end
