class Vertex
  attr_accessor :key, :sum, :left, :right, :parent

  def initialize(key, sum, left, right, parent)
    @key = key
    @sum = sum
    @left = left
    @right = right
    @parent = parent
  end

  def left_sum
    @left ? @left.sum : 0
  end

  def right_sum
    @right ? @right.sum : 0
  end
end

class SplayTree
  class << self
    def update(v)
      return unless v
      v.sum = v.key + v.left_sum + v.right_sum
      v.left.parent = v if v.left
      v.right.parent = v if v.right
    end

    def small_rotation(v)
      parent = v.parent
      return unless parent
      grandparent = v.parent.parent
      if parent.left == v
        tmp = v.right
        v.right = parent
        parent.left = tmp
      else
        tmp = v.left
        v.left = parent
        parent.right = tmp
      end
      update(parent)
      update(v)
      v.parent = grandparent
      if grandparent
        if grandparent.left == parent
          grandparent.left = v
        else
          grandparent.right = v
        end
      end
    end

    def big_rotation(v)
      if v.parent.left == v && v.parent.parent.left == v.parent # zig-zig
        small_rotation(v.parent)
        small_rotation(v)
      elsif v.parent.right == v && v.parent.parent.right == v.parent # zig-zig
        small_rotation(v.parent)
        small_rotation(v)
      else
        small_rotation(v)
        small_rotation(v)
      end
    end

    def splay(v)
      return unless v
      while v.parent
        if !v.parent.parent
          small_rotation(v)
          break
        end
        big_rotation(v)
      end
      v
    end

    def find(root, key)
      v = root
      last = root
      next_v = nil
      while v
        last = v
        if v.key >= key && (next_v.nil? || v.key < next_v.key)
          next_v = v
        end
        break if v.key == key
        (v.key < key) ? v = v.right : v = v.left
      end
      root = splay(last)
      return next_v, root
    end

    def split(root, key)
      result, root = find(root, key)
      return root, nil unless result
      right = splay(result)
      left = right.left
      right.left = nil
      left.parent = nil if left
      update(left)
      update(right)
      return left, right
    end

    def merge(left, right)
      return right if !left
      return left if !right
      while right.left
        right = right.left
      end
      right = splay(right)
      right.left = left
      update(right)
      right
    end
  end
end

class RangeSum
  @root = nil

  def insert(x)
    left, right = SplayTree.split(@root, x)
    new_v = nil
    if right.nil? || right.key != x
      new_v = Vertex.new(x, x, nil, nil, nil)
    end
    @root = SplayTree.merge(SplayTree.merge(left, new_v), right)
  end

  def erase(x)
    # todo
  end

  def search(x)
    # todo
    false
  end

  def sum(from, to)
    left, mid = SplayTree.split(@root, from)
    mid, right = SplayTree.split(mid, to+1)
    ans = 0
    # todo
    ans
  end
end

if __FILE__ == $0
  MODULO = 1_000_000_001
  range_sum = RangeSum.new
  n = STDIN.gets.to_i
  last_sum_res = 0
  (0...n).each {
    line = STDIN.gets.split
    if line[0] == '+'
      x = line[1].to_i
      range_sum.insert((x + last_sum_res) % MODULO)
    elsif line[0] == '-'
      x = line[1].to_i
      range_sum.erase((x + last_sum_res) % MODULO)
    elsif line[0] == '?'
      x = line[1].to_i
      if range_sum.search((x + last_sum_res) % MODULO)
        puts 'Found'
      else
        puts 'Not found'
      end
    elsif line[0] == 's'
      l, r = line[1..2].map(&:to_i)
      res = range_sum.sum((l + last_sum_res) % MODULO, (r + last_sum_res) % MODULO)
      puts res
      last_sum_res = res % MODULO
    end
  }
end