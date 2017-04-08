class Vertex
  attr_accessor :key, :sum, :left, :right, :parent

  def initialize(key, sum, left, right, parent)
    @key = key
    @sum = sum
    @left = left
    @right = right
    @parent = parent
  end

  def has_left?
    !@left.nil?
  end

  def has_right?
    !@right.nil?
  end

  def left_sum
    has_left? ? @left.sum : 0
  end

  def right_sum
    has_right? ? @right.sum : 0
  end
end

class SplayTree
  class << self
    def update(v)
      return if v.nil?
      v.sum = v.key + v.left_sum + v.right_sum
      v.left.parent = v if v.has_left?
      v.right.parent = v if v.has_right?
    end

    def small_rotation(v)
      parent = v.parent
      return if parent.nil?
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
      unless grandparent.nil?
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
      return if v.nil?
      until v.parent.nil?
        if v.parent.parent.nil?
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
      until v.nil?
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
      return root, nil if result.nil?
      right = splay(result)
      left = right.left
      right.left = nil
      left.parent = nil unless left.nil?
      update(left)
      update(right)
      return left, right
    end

    def merge(left, right)
      return right if left.nil?
      return left if right.nil?
      while right.left != nil
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