# frozen-string-literal: true

# LinkedList class | Will represent the full list
class LinkedList
  attr_accessor :head

  def initialize(value)
    @head = Node.new(value)
  end

  # Adds a new node containing value to the end of the list
  def append(value)
    current_node = @head
    current_node = current_node.next_node until current_node.next_node.nil?

    current_node.next_node = Node.new(value)
  end

  def display
    current_node = @head
    print "#{current_node.value} -> " until current_node.nil?

    puts 'nil'
  end

  # Adds a new node containing value to the start of the list
  def prepend(value)

  end

  # Returns the total number of nodes in the list
  def size

  end

  # Returns the first node in the list
  def head

  end

  # Returns the last node in the list
  def tail

  end

  # Returns the node at the given index
  def at(index)

  end

  # Removes the last element from the list
  def pop

  end

  # Returns true if the passed in value is in the list and false otherwise
  def contains?(value)

  end

  # Returns the index of the node containing value, or nil if not found.
  def find(value)

  end

  # Represent the linked list objects as strings, so they can be printed out and previewd in the console
  # The format should be `( value ) -> ( value) -> ( value ) -> nil`
  def to_s

  end
end

# Node class | Contains value method and a link to the next node
class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new(10)

list.display
