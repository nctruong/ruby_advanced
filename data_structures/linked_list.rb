class Node
  attr_accessor :node, :next

  def initialize(node)
    @node = node
  end
end

class LinkedList
  attr_accessor :n1
  def initialize(n1)
    @n1 = n1
  end

  def last_node
    class << n1
      def find_last node
        node.next.nil? ? node : self.find_last(node.next)
      end
    end
    n1.find_last n1
  end

  def add_node node
    last_node.next = node
  end

  def find_node_by_name name
    found_node n1, name
  end

  def insert_node new_node, behind_node
    swap_nodes new_node, behind_node
  end

  def list_nodes
    node = n1
    nodes = [node.node]
    while !node.next.nil?
      node = node.next
      nodes << node.node
    end
    nodes
  end

  private
  def found_node n, name
    n.node == name ? true : (n.next.nil? ? false : found_node(n.next, name))
  end
  def swap_nodes n1, n2
    next_node = n2.next
    n2.next = n1
    n1.next = next_node
  end
end

# TEST
n1 = Node.new('n1')
n2 = Node.new('n2')
n3 = Node.new('n3')
n4 = Node.new('n4')
n5 = Node.new('n5')

n1.next = n2
n2.next = n3
n3.next = n4
n4.next = n5

llist = LinkedList.new n1

p llist.find_node_by_name "n6"
p "last node: " << llist.last_node.node
n6 = Node.new('n6')
n7 = Node.new('n7')
llist.add_node n6
p "last node: " << llist.last_node.node
p llist.list_nodes

llist.insert_node n7, n3
p llist.list_nodes