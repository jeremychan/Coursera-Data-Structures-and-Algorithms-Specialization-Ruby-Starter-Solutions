class TreeOrders
  def read_input
    n = STDIN.gets.to_i
    @key = Array.new(n)
    @left = Array.new(n)
    @right = Array.new(n)
    (0...n).each {|i|
      key, left, right = STDIN.gets.split.map(&:to_i)
      @key[i] = key
      @left[i] = left
      @right[i] = right
    }
  end

  def in_order

  end

  def pre_order

  end

  def post_order

  end

  def run
    read_input
    in_order
    pre_order
    post_order
  end
end

if __FILE__ == $0
  tree_orders = TreeOrders.new
  tree_orders.run
end