def lcm(a, b)
  # write your code here
end

if __FILE__ == $0
  a, b = gets.split.map(&:to_i)
  puts "#{lcm(a, b)}"
end
