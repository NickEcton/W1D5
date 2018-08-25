class PolyTreeNode

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
     @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(value)
    if @parent != nil
      @parent.children.delete(self)
    end
    @parent = value
    return nil if value == nil
    @parent.children << self unless @parent.children.include?(self)
  end

  def add_child(child_node)
    child_node.parent=(self)
  end

  def remove_child(child_node)
    if self.children.include?(child_node) == false
      raise "Not my child"
    end
    child_node.parent=(nil)

  end

  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |el|
      search = el.dfs(target_value)
      return search if search != nil
    end
    nil
  end

  def bfs(target_value)
    arr = []
    arr << self
    until arr.empty?
      shifted = arr.shift
      if shifted.value == target_value
        return shifted
      else
      arr.concat(shifted.children)
      end
    end 
  end

end
