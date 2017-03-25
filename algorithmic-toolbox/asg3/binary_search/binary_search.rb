def binary_search(x, a)
  do_search(x, a, 0, a.length-1)
end

def do_search(x,a,l,r)
  # write your code here
end

if __FILE__ == $0
  data = STDIN.read.split.map(&:to_i)
  n = data[0]
  a = data[1..n]
  m = data[n+1]
  data[n+2, m].each { |b| print("#{binary_search(b, a)} ") }
  puts ""
end
