
# wants a proc, a lambda, AND a block
module Customfunction
  def three_ways(proc, lambda, &block)
    proc.call
    lambda.call
    yield # like block.call
  end

  def will_block(i, proc, lambda, &block)
    puts "===============================Below is callback function\n"*i
    yield

    lambda.call
    proc.call
  end
end

include Customfunction
# 1. return will throw error and exit
proc    = Proc.new {
  puts "will's proc"
  # return
}

# 2. return but still can do the next command in "the function called it"
lda     = lambda {
  puts "will's lambda"
  # return
}

# 3
will_block(3, proc, lda) do
  puts "I'm will's block"
end

# 4
anonymous = Proc.new { puts "I'm a Proc for sure." }
nameless  = lambda { puts "But what about me?" }
three_ways(anonymous, nameless) do
  puts "I'm a block, but could it be???"
end