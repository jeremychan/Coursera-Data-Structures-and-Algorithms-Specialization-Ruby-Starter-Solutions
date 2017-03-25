def optimal_summands(n)
  summands = []
  find(summands, n, 1)
  summands
end

def find(summands, k, l)
  # write your code here
end

if __FILE__ == $0
  n = gets.to_i
  summands = optimal_summands(n)
  puts "#{summands.size}"
  puts "#{summands.join(' ')}"
end