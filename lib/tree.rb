##
# This class represents a tree where each node has an array of children.
class Tree

  ##
  # Reads the key of the tree's root.
  attr_reader :key

  ##
  # Reads or sets the tree's array of children.
  attr_accessor :children

  ##
  # Creates a new tree with the root node key
  # specified by the +key+ param as the @key for the instance.
  def initialize(key)
    @key = key
    @children = []
  end

  ## 
  # Sets the key of the tree's root node, unless +new_key+ is nil.
  # (To remove a node, set the entire node to nil.)
  def key=(new_key)
    if new_key
      @key = new_key
    end
    @key
  end

  ##
  # Searches through all nodes of the tree, moving outward from the root.
  # Looks for first node with key equal to the +target_key+ param.
  # Returns nil if no such node is found.
  # def breadth_first_search_forced(target_key)
  #   if target_key == @key
  #     return @key
  #   else
  #     @children.each do |c|
  #       if c.key == target_key
  #         return c
  #       end
  #     end
  #     @children.each do |c|
  #       c.children.each do |cc|
  #         if cc.key == target_key
  #           return cc
  #         end
  #       end
  #     end
  #     return nil
  #   end
  # end

  # def breadth_first_search_recursive(tree, target_key)
  #   if target_key == tree.key
  #     return tree.key
  #   else
  #     tree.children.each do |c|
  #       breadth_first_search_recursive(c, target_key)
  #     end
  #   end
  #   # return nil?
  # end

  def breadth_first_search(target_key)
    q = [self]
    until q.empty?
      q.each do |node|
        if target_key == node.key
          return node
        else
          q += node.children
          q.shift
        end
      end
    end
    return nil
  end

end