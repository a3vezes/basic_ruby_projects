require_relative './node'

class BinarySearchTree
  def initialize(array)
    @array = array
    @root = create(@array, 0, array.size - 1)
  end

  def create(array = @array, start, finish)
    return if start > finish

    mid = (start + finish) / 2
    node = Node.new(array[mid])

    node.left = create(array, start, mid - 1)
    node.right = create(array, mid + 1, finish)

    node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

arr = [1, 2, 3, 4, 5, 6, 7]
bst = BinarySearchTree.new(arr)
bst.pretty_print
