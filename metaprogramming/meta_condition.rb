# block with lambda - like include code inside {}
def leader?(condition)
  if condition.call
    p "Correct!"
  else
    p "Incorrect!"
  end
end

condition = lambda {
  x = 2 + 3
  leader = false
}

leader?(condition)

# lambda as include code
class A
  def self.say
    p "hello"
  end
end
a_class = lambda { A }
a_class.call.say