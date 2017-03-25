def get_number_of_inversions(a)
  # write your code here
end

if __FILE__ == $0
  n, *a = STDIN.read.split.map(&:to_i)
  puts get_number_of_inversions(a)
end
