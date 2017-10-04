class MyQueue
  attr_accessor :queue

  def initialize
    @queue = []
  end

  def enqueue element
    queue.push element
  end

  def dequeue
    queue.shift
  end
end

queue = MyQueue.new
queue.enqueue 1
queue.enqueue 2
queue.enqueue 3
queue.dequeue
p queue.queue
