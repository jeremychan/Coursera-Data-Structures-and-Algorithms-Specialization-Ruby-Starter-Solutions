def knapsack(capacity, num_item, items)
  # write your code here
end

if __FILE__ == $0
  data = STDIN.read.split.map(&:to_i)
  capacity, num_items = data[0], data[1]
  items = data[2..-1]
  puts "#{knapsack(capacity,num_items,items)}"
end
