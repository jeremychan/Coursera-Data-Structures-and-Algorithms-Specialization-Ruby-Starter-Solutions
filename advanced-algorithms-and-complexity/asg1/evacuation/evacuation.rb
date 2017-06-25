class Node
  attr_accessor :id, :adj

  def initialize(id)
    @id = id
    @adj = []
  end

  def add_adj(path)
    existing = find_path(path.v)
    if existing
      existing.capacity += path.capacity
      existing.utilized += path.utilized
    else
      @adj << path
    end
  end

  def find_path(v)
    @adj.each {|adj|
      if adj.v == v
        return adj
      end
    }
    nil
  end

  def to_s
    "#{@id}->[#{@adj.map {|adj| adj.v}.join(", ")}]"
  end
end

class Path
  attr_accessor :u, :v, :capacity, :utilized

  def initialize(u, v, c)
    @u = u
    @v = v
    @capacity = c
    @utilized = 0
  end

  def to_s
    "(#{@u}->#{v} [#{utilized}/#{capacity}])"
  end

  def remaining
    @capacity - @utilized
  end

  def send(flow)
    @utilized += flow
  end
end

class FlowMap
  attr_accessor :nodes, :paths

  def initialize(n)
    @nodes = []
    @n = n
    (0...n).each {|i|
      @nodes << Node.new(i)
    }
  end

  def add_path(u, v, c)
    path = Path.new(u, v, c)
    @nodes[u].add_adj(path)
  end

  def get_paths
    @nodes.flat_map{|node| node.adj}
  end
end


def max_flow(g)
  0
end

if __FILE__ == $0
  n, m = STDIN.gets.split.map(&:to_i)
  flow_map = FlowMap.new(n)
  (0...m).each {
    u, v, c = STDIN.gets.split.map(&:to_i)
    flow_map.add_path(u-1, v-1, c)
  }
  puts "#{max_flow(flow_map)}"
end