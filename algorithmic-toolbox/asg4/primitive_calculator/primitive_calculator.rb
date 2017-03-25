def primitive_calculator(n)
  # write your code here
end

if __FILE__ == $0
  data = STDIN.read.split.map(&:to_i)
  n = data[0]
  (k, a) = primitive_calculator(n)
  puts "#{k}"
  puts "#{a.join(' ')}"
end