def fib_huge(n, m)
  # write your code here
end

if __FILE__ == $0
  a, b = gets.split.map(&:to_i)
  puts "#{fib_huge(a, b)}"
end