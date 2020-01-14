class LinkedList

  attr_accessor :name

  def initialize
    @head = nil
    @tail = nil
  end

  def prepend(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def append(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  def size(default = @head, count = 0)
    return 0 if @head.nil? && @tail.nil?

    if !default.next_node.nil?
      count += 1
      size(default.next_node, count)
    else
      count += 1
    end
  end

  def head
    if @head.nil? 
      return "Empty List!\n"
    else
      return @head
    end
  end

  def tail
    if @tail.nil?
      return "Empty List!\n"
    else
      @tail
    end
  end
  
  def at(index, default = @head, count = 0)
    if @head.nil?
      print "Empty List!\n"
      nil
    elsif default.nil?
      print "No node at this index!\n"
      nil
    elsif count == index
      default
    else
      count += 1
      at(index, default.next_node, count)
    end
  end

  def pop(default = @head)
    if default.nil?
      print "Empty List!\n"
      nil
    elsif default.next_node == @tail
      @tail = default
      default.next_node = nil
      @tail
    else
      pop(default.next_node)
    end
  end

  def contains?(value, default = @head)
    if default.value == value
      true
    elsif default.next_node == nil
      false
    else
      contains?(value, default.next_node)
    end
  end

  def find(data, default = @head, count = 0)
    if default.value == data
      count
    elsif default.next_node == nil
      nil
    else
      count += 1
      find(data, default.next_node, count)
    end
  end

  def to_s(default = @head)
    if @head == nil
      print "This list is empty!\n"
      nil
    elsif default.next_node != nil 
      print "#{(default.value)} -> "
      to_s(default.next_node)
    else
      print "#{(default.value)} -> nil\n"
    end
  end

  def insert_at(index, node, default = @head)
    if index == 0
      node.next_node = self.at(index)
      @head = node
    elsif self.at(index) == nil
      print "No node here!\n"
      nil
    else
      node.next_node = self.at(index)
      self.at(index-1).next_node = node
    end
  end

  def remove_at(index, default = @head)
    if index == 0
      @head = self.at(index+1)
    elsif self.at(index) == nil
      print "No node here!\n"
      nil
    elsif self.at(index).next_node == nil
      self.at(index-1).next_node = nil
      @tail = self.at(index-1)
    else
      self.at(index-1).next_node = self.at(index+1)
    end
  end
end

class Node
  attr_accessor :next_node, :value

  def initialize(value=nil)
    @next_node = nil
    @value = value
  end
end

data1 = "Tiffany"
data2 = "Robert"
data3 = "Suazo"
data4 = "Ruby"

item1 = Node.new
item1.value = data1

item2 = Node.new
item2.value = data2

item3 = Node.new
item3.value = data3

item4 = Node.new
item4.value = data4

list = LinkedList.new
list.prepend(item1)
list.prepend(item2)
list.append(item3)
list.to_s


list.insert_at(1, item4)
list.to_s
list.remove_at(0)
list.to_s