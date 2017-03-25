def get_majority_element(a, left, right)
  # write your code here
end

if __FILE__ == $0
  n, *a = STDIN.read.split.map(&:to_i)
  answer = get_majority_element(a, 0, n-1) != -1
  puts "#{answer ? 1 : 0}"
end
