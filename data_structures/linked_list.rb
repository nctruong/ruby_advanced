class Node
  attr_accessor :key, :next_, :prev

  def initialize(key)
    @key = key
  end
end

class LinkedList
  def insert node, node_before = nil, node_after = nil
    raise "not implemented yet"
  end

  def delete key
    raise "not implemented yet"
  end

  def search
    raise "not implemented yet"
  end

  def empty?
    raise "not implemented yet"
  end
end

class SinglyLinkedList < LinkedList
  attr_accessor :nodes
  attr_accessor :head, :tail

  def initialize
    @nodes = Array.new
  end

  def add node
    push node
  end

  def insert node_before, node, node_after
    if node_after.nil?
      # add to after tail - default, no matter node_before is nil or not.
      push node
    elsif node_before.nil?
      # add to before head
      unshift node
    else
      # insert to middle list
      node_before.next = node
      node.next_ = node_after
    end
  end

  def delete key
    node = search key
    unless node.nil?
      prev = prev node
      unless prev.nil?
        prev.next_ = node.next_
      else
        @head = node.next_
      end
    end
  end

  # return nil if key not found
  def search key, lambda = {}
    node = head
    while node.next_ != nil && node.key != key
      node = node.next_
    end
    node
  end

  def show
    list = String.new
    node = head
    while !node.nil?
      list += node.key.to_s
      node = node.next_
    end
    p list
  end

  def empty?
    @head.nil? ? true : false
  end

  private
    def unshift node
      node.next_ = @head
      @head = node
      @nodes << node
    end

    def push node
      @head = node if head.nil?
      tail.next_ = node unless tail.nil?
      @tail = node
      node.next_ = nil
      @nodes << node
    end

    # cases: head, middle, tail
    def prev node_or_key
      key = String.new
      case node_or_key
        when Node
          key = node_or_key.key
        when String
          key = node_or_key
        else
          p "only accept String or Node type"
      end

      prev = node = @head
      while node.next_ != nil && node.key != key
        prev = node
        node = node.next_
      end
      prev == node ? nil : prev
    end

end

list = SinglyLinkedList.new
n1 = Node.new 1
n2 = Node.new 2
list.add n1
list.insert  nil, n2, n1
list.show
list.delete 2
list.show
# if list.empty?
#   p "empty list"
# end
# list.delete 2
# list.show

# "12"
# "1"