def fib_partial_sum(m, n)
  # write your code here
end

if __FILE__ == $0
  m, n = gets.split.map(&:to_i)
  puts "#{fib_partial_sum(m, n)}"
end
