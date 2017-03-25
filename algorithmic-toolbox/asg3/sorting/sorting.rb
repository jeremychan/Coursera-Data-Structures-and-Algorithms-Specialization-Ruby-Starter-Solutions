def partition3(a, l, r)
  # write your code here
end

def randomized_quick_sort(a, l, r)
  return nil if l >= r

  k = rand(l..r)
  a[l], a[k] = a[k], a[l]
  m, n = partition3(a, l, r)
  randomized_quick_sort(a, l, m - 1);
  randomized_quick_sort(a, n + 1, r);
end

if __FILE__ == $0
  n, *a = STDIN.read.split.map(&:to_i)
  randomized_quick_sort(a, 0, n - 1)
  puts "#{a.join(' ')}"
end
