require_relative './node'
require 'pry'

class BinarySearchTree
  attr_accessor :root

  def initialize(root = nil)
    @root = root
  end

  def search(value)

    current = self.root
		
		while current && current.value != value
			current = value < current.value ? current.left : current.right
		end

		current

  end

  def insert(value)
		new_node = Node.new(value)

		if @root.nil?
      @root = new_node
      return @root
    end

    current = self.root

		while current
			return nil if value == current.value

			if value < current.value
				if current.left.nil?
					current.left = new_node
					return new_node
				end
				current = current.left
			else
				if current.right.nil?
					current.right = new_node
					return new_node
				end
				current = current.right
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
