# using yield, no argument
def speak
  puts yield
end
speak { "Hello There"}

# block with arguments
def block_with_argument(first, second)
  yield(first, second)
end
block_with_argument("first", "second") { |f,s|
  puts f
  puts s
}

def read_number(number)
  case number
    when 1
      mes = "one"
    when 2
      mes = "two"
  end
  yield mes
end
read_number(1){ |mes|
  puts "You inputted: " << mes
}

# multiple blocks: can't do it. Look at the error below.
# def multiple_blocks(&block1,&block2)
#   block1.call
#   block2.call
# end
