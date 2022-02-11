require './node'

class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      @tail.next_node = new_node
    end
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new(value)
    if @tail.nil?
      @tail = new_node
    else
      new_node.next_node = @head
    end
    @head = new_node
  end

  def size(node = @head)
    node.next_node.nil? ? 1 : 1 + size(node.next_node)
  end

  def dig(index)
    curr_node = @head

    index.times { curr_node = curr_node.next_node }

    curr_node
  end

  def at(index)
    node = dig(index)
    puts node.value
  end

  def pop
    new_tail = dig((size - 2))
    @tail = new_tail
    new_tail.next_node = nil
  end

  def contains?(value)
    contains = false
    curr_node = @head

    until curr_node.nil?
      if curr_node.value == value
        contains = true
        break
      end
      curr_node = curr_node.next_node
    end
    contains
  end

  def find(value)
    index = nil
    curr_node = @head
    i = 0

    until curr_node.nil?
      if curr_node.value == value
        index = i
        break
      end
      curr_node = curr_node.next_node
      i += 1
    end
    index
  end

  def to_s
    output = ''
    curr_node = @head

    until curr_node.nil?
      output << "( #{curr_node.value} ) -> "

      curr_node = curr_node.next_node
    end
    output << 'nil'
  end
end
