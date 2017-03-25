def eval(a, b, op)
  if op == '+'
    return a + b
  elsif op == '-'
    return a - b
  else
    return a * b
  end
end

def get_maximum_value(d, op)
  # write your code here
end

def parse(expr)
  d = expr.scan(/\d+/)
  op = expr.scan(/[+*-]/)
  return d, op
end

if __FILE__ == $0
  expr = STDIN.read
  d,op = parse(expr)
  get_maximum_value(d, op)
end
