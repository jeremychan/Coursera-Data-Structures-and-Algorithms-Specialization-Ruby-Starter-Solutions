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
    @left.sum if has_left? else 0
  end

  def right_sum
    @right.sum if has_right? else 0
  end
end

class SplayTree
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
end