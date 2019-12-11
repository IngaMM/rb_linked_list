#!/usr/bin/ruby

class LinkedList

  def initialize(value)
    @head = Node.new(value)
  end

  def find_last_node
    last_node = @head
    while last_node.next_node do
      last_node = last_node.next_node
    end
    last_node
  end

  def append(value)
    last_node = find_last_node
    new_node = Node.new(value)
    last_node.next_node = Node.new(value)
  end

  def prepend(value)
    was_first = @head
    @head = Node.new(value)
    @head.next_node = was_first
  end

  def size
    node_to_count = @head
    counter = 0
    while node_to_count.next_node do
      counter += 1
      node_to_count = node_to_count.next_node
    end
    counter + 1
  end

  def head
    @head.value
  end

  def tail
    find_last_node.value
  end

  def at(index)
    if (index + 1 > size)
      return "Error: Maximum index: #{size - 1}"
    end
    node_to_return = @head
    counter = 0
    while (counter < index && node_to_return.next_node) do
      counter += 1
      node_to_return = node_to_return.next_node
    end
    node_to_return.value
  end

  def pop
    previous_node = nil
    last_node = @head
    while last_node.next_node do
      previous_node = last_node
      last_node = last_node.next_node
    end
    if (previous_node)
      previous_node.next_node = nil
    else  # Special treatment if only the head is left
      last_node.value = nil
    end
  end

  def contains?(value_to_check)
    is_included = false
    node_to_check = @head
    is_included = true if node_to_check.value == value_to_check
    while node_to_check.next_node do
      node_to_check = node_to_check.next_node
      is_included = true if node_to_check.value == value_to_check
    end
    is_included
  end

  def find(data)
    counter = 0
    node_to_check = @head
    if (node_to_check.value == data)
      return counter
    end
    while node_to_check.next_node do
      node_to_check = node_to_check.next_node
      counter += 1
      if node_to_check.value == data
        return counter
      end
    end
    nil
  end

  def to_s
    node_to_string = @head
    string = "#{node_to_string.value}"
    while node_to_string.next_node do
      node_to_string = node_to_string.next_node
      string += " -> #{node_to_string.value}"
    end
    string += " -> nil"
    string
  end

  def insert_at(index, value)
    if (index > size)
      p "Error: Maximum index for insertion: #{size}"
      return
    elsif (index == 0)
      prepend(value)
    elsif (index == size)
      append(value)
    else
      counter = 1
      node_before_insert = @head
      while (counter < index) do
        counter += 1
        node_before_insert = node_before_insert.next_node
      end
      node_after_insert = node_before_insert.next_node
      new_node = Node.new(value)
      node_before_insert.next_node = new_node
      new_node.next_node = node_after_insert
    end
  end

  def remove_at(index)
    if (index > size - 1)
      p "Error: Maximum index for removal: #{size - 1}"
      return
    elsif (index == size - 1)
      pop
    elsif (index == 0)
      @head = @head.next_node
    else
      counter = 0
      node_to_remove = @head
      while (counter < index) do
        counter += 1
        node_before_removal = node_to_remove
        node_to_remove = node_to_remove.next_node
      end
      node_before_removal.next_node = node_to_remove.next_node
    end
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

ll = LinkedList.new('How')
p ll
ll.append('are')
p ll
ll.append('you')
ll.append('today?')
ll.prepend('Hello')
p ll
p ll.size
puts 'Head'
p ll.head
puts 'Tail'
p ll.tail
puts 'Index 0'
p ll.at(0)
puts 'Index 1'
p ll.at(1)
puts 'Index 2'
p ll.at(2)
puts 'Index 4'
p ll.at(4)
ll.pop
p ll
puts ll.contains?('Hello')
puts ll.find('How')
puts ll.contains?('are')
puts ll.find('are')
puts ll.to_s
ll.insert_at(2, 'good')
puts ll.to_s
ll.remove_at(0)
puts ll.to_s
