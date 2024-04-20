# frozen-string-literal: true

# LinkedList class | Will represent the full list
class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  # Adds a new node containing value to the end of the list
  def append(value)
    if @head
      find_tail.next_node = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  # Finds the last node of the linked list
  def find_tail
    node = @head

    node = node.next_node while node&.next_node # node.next_node if node.next_node != nil

    node
  end

  # Adds a new node containing value to the start of the list
  def prepend(value)
    new_node = Node.new(value, @head)
    @head = new_node # new_node becomes the head
  end

  # Returns the total number of nodes in the list
  def size
    node = @head
    count = 0

    while node
      count += 1
      node = node.next_node
    end

    count
  end

  # Returns the last node in the list
  def tail
    find_tail
  end

  # Returns the node at the given index
  def at(index)
    node = @head
    index.times do
      node = node.next_node
      return nil unless node
    end
    node
  end

  # Removes the last element from the list
  def pop
    if @head.next_node.nil?
      # If there is only one node in the list
      @head = nil
    else
      # If there are multiple nodes in the list
      node = @head
      # Traverse the list until the second to last node
      node = node.next_node until node.next_node.next_node.nil?
      node.next_node = nil
    end
  end

  # Returns true if the passed in value is in the list and false otherwise
  def contains?(value)
    node = @head

    while node
      return true if node.value == value

      node = node.next_node
    end
    false
  end

  # Returns the index of the node containing value, or nil if not found.
  def find(value)
    node = @head
    index = 0

    while node
      return index if node.value == value

      node = node.next_node
      index += 1
    end
    nil
  end

  # Represent the linked list objects as strings, so they can be printed out and previewd in the console
  # The format should be `( value ) -> ( value) -> ( value ) -> nil`
  def to_s
    node = @head
    string = ''

    while node
      string += "( #{node.value} ) -> "
      node = node.next_node
    end

    string += 'nil'
    string
  end

  def insert_at(value, index)
    if index.zero?
      prepend(value)
    else
      new_node = Node.new(value)
      prev_node = at(index - 1)
      new_node.next_node = prev_node.next_node
      prev_node.next_node = new_node
    end
  end

  def remove_at(index)
    if index.zero?
      @head = @head.next_node
    else
      prev_node = at(index - 1)
      prev_node.next_node = prev_node.next_node.next_node
    end
  end
end

# Node class | Contains value method and a link to the next node
class Node
  attr_accessor :next_node
  attr_reader :value

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def to_s
    "Node with value: #{@value}"
  end
end

list = LinkedList.new
list.append(5)
list.append(10)
list.append(15)

puts list
