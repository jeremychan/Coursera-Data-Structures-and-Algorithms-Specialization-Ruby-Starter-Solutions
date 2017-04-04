class CheckBst
  def read_input
    n = STDIN.gets.to_i
    @key = Array.new(n)
    @left = Array.new(n)
    @right = Array.new(n)
    (0...n).each {|i|
      key, left, right = STDIN.gets.split.map(&:to_i)
      @key[i] = key
      @left[i] = left
      @right[i] = right
    }
  end

  def is_bst
    true
  end

  def run
    read_input
    if is_bst
      puts "CORRECT"
    else
      puts "INCORRECT"
    end
  end
end

if __FILE__ == $0
  check_bst = CheckBst.new
  check_bst.run
end