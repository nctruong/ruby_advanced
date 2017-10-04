
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
end

stack = MyStack.new
stack.push 1
stack.push 2
stack.push 3
stack.pop
p stack.stack
