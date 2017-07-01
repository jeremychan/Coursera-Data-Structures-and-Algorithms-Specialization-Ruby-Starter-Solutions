Position = Struct.new(:column, :row)

class Solver

  def read_equation
    @size = STDIN.gets.strip.to_i
    @a = []
    @b = []
    (0...@size).each {
      line = STDIN.gets.strip.split.map(&:to_f)
      @a << line[0..-2]
      @b << line[-1]
    }
  end

  def solve
    @used_columns = Array.new(@size) {false}
    @used_rows = Array.new(@size) {false}
    (0...@size).each {
      pivot_element = select_pivot
      swap_lines(pivot_element)
      process_pivot(pivot_element)
      mark_pivot_used(pivot_element)
    }
  end

  def mark_pivot_used(pivot_element)
    @used_rows[pivot_element.row] = true
    @used_columns[pivot_element.column] = true
  end

  def swap_lines(pivot_element)
    @a[pivot_element.column], @a[pivot_element.row] = @a[pivot_element.row], @a[pivot_element.column]
    @b[pivot_element.column], @b[pivot_element.row] = @b[pivot_element.row], @b[pivot_element.column]
    @used_rows[pivot_element.column], @used_rows[pivot_element.row] = @used_rows[pivot_element.row], @used_rows[pivot_element.column]
    pivot_element.row = pivot_element.column
  end

  def process_pivot(pivot_element)

  end

  def select_pivot
    # This algorithm selects the first free element.
    # You'll need to improve it to pass the problem.
    last_unused_row = @used_rows.index(false)
    last_unused_col = @used_columns.index(false)
    Position.new(last_unused_row, last_unused_col)
  end

  def print_result
    puts "#{@b.map{|y| "#{'%.20f' % y}"}.join(' ')}"
  end

end

if __FILE__ == $0
  solver = Solver.new
  solver.read_equation
  solver.solve
  solver.print
end
