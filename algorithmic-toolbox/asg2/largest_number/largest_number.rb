def largest_number(a)
  # write your code here
end

def largest_number_naive(a)
  largest = -1
  a.permutation.each {|x|
    res = x.join('').to_i
    largest = res if res > largest
  }
  largest
end

if __FILE__ == $0
  a = STDIN.read.split.drop(1)
  puts largest_number(a)
end