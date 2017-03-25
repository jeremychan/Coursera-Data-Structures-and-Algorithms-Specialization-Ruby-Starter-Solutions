class Item
  attr_accessor :unit_value, :weight
  def initialize(value, weight)
    @unit_value = value.to_f/weight
    @weight = weight
  end

  def display
    "unit_value = #{@unit_value}, weight=#{@weight}"
  end
end

def get_optimal_value(capacity, weights, values)
  # write your code here
end

if __FILE__ == $0
  data = STDIN.read.split().map(&:to_i)
  n, capacity = data[0,2]
  values = data.values_at(*(2..2*n).step(2))
  weights = data.values_at(*(3..2*n+1).step(2))

  answer = get_optimal_value(capacity, weights, values)
  puts "#{'%.4f' % answer}"
end