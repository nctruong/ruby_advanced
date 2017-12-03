
class MyStack
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def push element
    stack.push element
  end

  def pop
    stack.pop
  end

  def empty?
    stack.empty?
  end
end

stack = MyStack.new
for i in (1..3) do
  stack.push i
end
p stack.stack

stack.pop
stack.pop
stack.pop
if stack.empty?
  p "empty stack"
end

# [1, 2, 3]
# "empty stack"
