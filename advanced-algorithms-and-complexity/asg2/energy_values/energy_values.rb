Equations = Struct.new(:a, :b)
Position = Struct.new(:column, :row)

class Solver

  def read_equation
    size = STDIN.gets.strip.to_i
    a = []
    b = []
    (0...size).each {
      line = STDIN.gets.strip.split.map(&:to_f)
      a << line[0..-2]
      b << line[-1]
    }
    @equation = Equations.new(a, b)
  end

  def solve
    a = @equation.a
    b = @equation.b
    size = @equation.a.length
    used_columns = Array.new(size) {false}
    used_rows = Array.new(size) {false}
    (0...size).each {
      pivot_element = select_pivot(a, used_rows, used_columns)
      swap_lines(a, b, used_rows, pivot_element)
      mark_pivot_used(pivot_element, used_rows, used_columns)
    }
  end

  def mark_pivot_used(pivot_element, used_rows, used_columns)
    used_rows[pivot_element.row] = true
    used_columns[pivot_element.column] = true
  end

  def swap_lines(a, b, used_rows, pivot_element)
    a[pivot_element.column], a[pivot_element.row] = a[pivot_element.row], a[pivot_element.column]
    b[pivot_element.column], b[pivot_element.row] = b[pivot_element.row], b[pivot_element.column]
    used_rows[pivot_element.column], used_rows[pivot_element.row] = used_rows[pivot_element.row], used_rows[pivot_element.column]
    pivot_element.row = pivot_element.column
    process_pivot(a, b, pivot_element)
  end

  def process_pivot(a, b, pivot_element)
    # code here
  end

  def select_pivot(a, used_rows, used_columns)
    # This algorithm selects the first free element.
    # You'll need to improve it to pass the problem.
    last_unused_row = used_rows.index(false)
    last_unused_col = used_columns.index(false)
    Position.new(last_unused_row, last_unused_col)
  end

  def print
    @equation.b.each {|y|
      puts "#{'%.20f' % y}"
    }
  end

end

if __FILE__ == $0
  solver = Solver.new
  solver.read_equation
  solver.solve
  solver.print
end
