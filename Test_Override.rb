class ObjectTest
  def class1_puts
    puts "I am class 1"
  end
end

# Define class at the second time: override old method if same name, adding more method if new name.
# It depends on the order of declaration.
class ObjectTest
  def class2_puts
    puts "I am class 2"
  end

  def class1_puts
    puts "I am class 1 but changed"
  end
end

obj = ObjectTest.new
obj.class1_puts 
obj.class2_puts

# ➜  ruby ruby Test_Override.rb
# I am class 1
# I am class 2
