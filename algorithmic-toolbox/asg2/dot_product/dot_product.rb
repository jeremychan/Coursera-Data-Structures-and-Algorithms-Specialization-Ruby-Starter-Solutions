def max_dot_product(a, b)
  # write your code here
end

if __FILE__ == $0
  data = STDIN.read.split.map(&:to_i)
  n = data[0]  
  a, b = data[1..n], data[n+1..2*n]
  puts "#{max_dot_product(a, b)}"
end