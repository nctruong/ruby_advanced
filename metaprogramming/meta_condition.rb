def leader?(condition)
  if condition.call
    p "Correct!"
  else
    p "Incorrect!"
  end
end


class A
  def self.say
    p "hello"
  end
end



leader = false
condition = lambda { leader = false }

leader?(condition)

a_class = lambda { A }
a_class.call.say