def edit_distance(str1, str2)
  # write your code here
end

if __FILE__ == $0
  data = STDIN.read.split.map(&:to_s)
  str1, str2 = data[0], data[1]
  puts "#{edit_distance(str1,str2)}"
end
