class Table
  attr_accessor :id, :rows, :rank, :parent

  def initialize(id, rows, rank, parent)
    @id, @rows, @rank, @parent = id, rows, rank, parent
  end
end

class MergingTable
  attr_accessor :n, :m, :num_rows, :rank, :parent

  def read_data
    @n, @m = STDIN.gets.split.map(&:to_i)
    num_rows = STDIN.gets.split.map(&:to_i)
    rank = Array.new (n) { 1 }
    parent = (0...n).to_a
    @tables = Array.new(n) { |i| Table.new(i, num_rows[i], rank[i], parent[i]) }
  end

  def process_data
    # write your code here
  end

  def run
    read_data
    process_data
  end
end

if __FILE__ == $0
  merging_table = MergingTable.new
  merging_table.run
end