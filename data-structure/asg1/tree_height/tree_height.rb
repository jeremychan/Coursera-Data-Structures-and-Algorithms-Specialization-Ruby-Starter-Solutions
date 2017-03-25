class Node
  attr_accessor :id, :children, :level

  def initialize(id)
    @id = id
    @children = Array.new
  end

  def add_child(child)
    @children.push(child)
  end
end

def init_tree(n, input)
  # write your code here
end

def find_height(root)
  # write your code here
end

if __FILE__ == $0
  data = STDIN.read.split.map { |i| i.to_i }
  n = data[0]
  input = data[1..-1]
  root = init_tree(n, input)
  puts "#{find_height(root)}"
end
