require_relative './node'
require 'pry'

class BinarySearchTree
  attr_accessor :root

  def initialize(root = nil)
    @root = root
  end

  def search(value)
		return nil if self.root == nil

    current = self.root
		
		while current
			return current if current.value == value

			if value < current.value
				current = current.left
			else
				current = current.right
			end
		end

		nil

  end

  def insert(value)
		new_node = Node.new(value)

		if @root.nil?
      @root = new_node
      return @root
    end

    current = self.root
		
		while current
			if value == current.value
				return nil
			elsif value < current.value && !current.left.nil?
				current = current.left
			elsif value > current.value && !current.right.nil?
				current = current.right
			elsif value < current.value
				current.left = new_node
				current = nil
				return new_node
			else
				current.right = new_node
				current = nil
				return new_node
			end
		end

		nil
  end

end 

tree = BinarySearchTree.new
tree.root = Node.new(5)
tree.root.left = Node.new(3)
tree.root.right = Node.new(11)

node = tree.insert(1)

# binding.pry
