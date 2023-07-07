class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
    else
      last_node.next_node = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
  end

  def size
    count = 0
    current_node = @head

    while current_node
      count += 1
      current_node = current_node.next_node
    end

    count
  end

  def head
    @head
  end

  def tail
    current_node = @head

    while current_node && current_node.next_node
      current_node = current_node.next_node
    end

    current_node
  end

  def at(index)
    current_node = @head
    count = 0

    while current_node && count < index
      current_node = current_node.next_node
      count += 1
    end

    current_node
  end

  def pop
    return if @head.nil?

    if @head.next_node.nil?
      @head = nil
    else
      previous_node = nil
      current_node = @head

      while current_node.next_node
        previous_node = current_node
        current_node = current_node.next_node
      end

      previous_node.next_node = nil
    end
  end

  def contains?(value)
    current_node = @head

    while current_node
      return true if current_node.value == value

      current_node = current_node.next_node
    end

    false
  end

  def find(value)
    current_node = @head
    index = 0

    while current_node
      return index if current_node.value == value

      current_node = current_node.next_node
      index += 1
    end

    nil
  end

  def insert_at(value, index)
    if index == 0
      prepend(value)
    elsif index >= size
      append(value)
    else
      new_node = Node.new(value)
      previous_node = at(index - 1)
      next_node = previous_node.next_node
      previous_node.next_node = new_node
      new_node.next_node = next_node
    end
  end

  def remove_at(index)
    return if @head.nil? || index < 0 || index >= size

    if index == 0
      @head = @head.next_node
    else
      previous_node = at(index - 1)
      current_node = previous_node.next_node
      previous_node.next_node = current_node.next_node
    end
  end

  def to_s
    current_node = @head
    string = ""

    while current_node
      string += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end

    string += "nil"
  end

  private

  def last_node
    current_node = @head

    while current_node && current_node.next_node
      current_node = current_node.next_node
    end

    current_node
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end

#Usage example
list = LinkedList.new

list.append(10)
list.append(20)
list.append(30)

puts list.to_s

list.insert_at(15, 1)

puts list.to_s

list.remove_at(2)

puts list.to_s