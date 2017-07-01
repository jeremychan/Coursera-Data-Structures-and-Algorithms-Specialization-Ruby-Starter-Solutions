def solve_diet_problem(n, m, a, b, c)
  # code here
  [0, [0] * m]
end

if __FILE__ == $0
  n,m = STDIN.gets.strip.split.map(&:to_i)
  a = []
  (0...n).each {
    a << STDIN.gets.strip.split.map(&:to_i)
  }
  b = STDIN.gets.strip.split.map(&:to_i)
  c = STDIN.gets.strip.split.map(&:to_i)

  anst, ansx = solve_diet_problem(n, m, a, b, c)

  if anst == -1
      puts "No solution"
  elsif anst == 0
      puts "Bounded solution"
      puts "#{ansx.map{|y| "#{'%.18f' % y}"}.join(' ')}"
  elsif anst == 1
      print("Infinity")
  end
end
