require 'set'

class Node
  attr_accessor :id, :adj, :type

  def initialize(id, type)
    @id = id
    @adj = []
    @type = type
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

  def initialize(u, v, c, utilized)
    @u = u
    @v = v
    @capacity = c
    @utilized = utilized
  end

  def to_s
    "(#{@u}->#{v} [#{utilized}/#{capacity}])"
  end

  def remaining
    @capacity - @utilized
  end
end

class FlowMap
  attr_accessor :nodes, :paths, :n, :s, :t, :m

  def initialize(n, m)
    @nodes = []
    @n = n
    @m = m
    (0...n).each {|i|
      @nodes << Node.new(i, :flight)
    }
    (0...m).each {|j|
      @nodes << Node.new(@n + j, :crew)
    }
  end

  def add_path(u, v, c, utilized)
    path = Path.new(u, v, c, utilized)
    @nodes[u].add_adj(path)
  end

  def add_airline_crew_link(airline, crew)
    u = airline
    v = @n + crew
    c = 1
    add_path(u, v, c, 0)
  end
end


def bipartite(g)
  []
end

if __FILE__ == $0
  n, m = STDIN.gets.split.map(&:to_i)
  flow_map = FlowMap.new(n, m)
  (0...n).each { |airline|
    crews = STDIN.gets.split.map(&:to_i)
    crews.each_with_index {|flag, crew|
      if flag == 1
        flow_map.add_airline_crew_link(airline , crew )
      end
    }
  }
  puts "#{bipartite(flow_map).join " "}"
end