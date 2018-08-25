require_relative '00_tree_node'
require 'byebug'
class KnightPathFinder
  attr_accessor :visited_positions
  def initialize(pos)
    @tree = PolyTreeNode.new(pos)
    @root_node = @tree
    @visited_positions = [pos]
    build_move_tree

  end

  def self.root_node

  end

  def build_move_tree
    initial_positions = @tree
    arr = []
    arr << initial_positions.value
    until arr.empty?
      new_move_positions(initial_positions).each do |el|
        our_child = PolyTreeNode.new(el)
        initial_positions.add_child(our_child)
        arr << our_child
      end
      arr.shift
      initial_positions = arr[0]
    end
  end

  #   # until new_move_positions(@root_node.value) == nil
  #     new_move_positions(@root_node.value).each do |el|
  #       @root_node.add_child(PolyTreeNode.new(el))
  #     end
  #     until @root_node.children.empty?
  #       @root_node.children.each do |children|
  #         new_move_positions(children.value).each do |childs_child|
  #           children.add_child(PolyTreeNode.new(childs_child))
  #         end
  #       end
  #       # @root_node = @root_node.children#
  #       p @root_node
  #   end
  # end

  def self.valid_moves(pos)
    #Each index cannot be higher than 7 nor lower than 0
    valid = []

    [[(pos.value[0] + 1), (pos.value[1] + 2)],
    [(pos.value[0] + 2), (pos.value[1] + 1)],
    [(pos.value[0] + 2), (pos.value[1] - 1)],
    [(pos.value[0] + 1), (pos.value[1] - 2)]].each do |possible_pos|
         possible_pos.each do |coordinate|
         if coordinate <= 7 && coordinate >= 0
           valid << possible_pos
         else
           next
         end
       end
     end
    valid
  end

  def new_move_positions(pos)
    debugger
    arr = []
    KnightPathFinder.valid_moves(pos).each do |el|
      arr << el unless @visited_positions.include?(el)
    end
    @visited_positions << arr
    arr
  end
end

a = KnightPathFinder.new([1,1])
a
