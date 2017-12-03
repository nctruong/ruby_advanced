class ObjectTest
  def class1_puts
    puts "I am class 1"
  end

  def self.class_method1
    p "class method 1"
  end

  def self.class_method2
    raise "not implemented yet"
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

  class << self
    def class_method2
      class_method1
    end
  end
end

obj = ObjectTest.new
obj.class1_puts 
obj.class2_puts
ObjectTest.class_method2

# ➜  ruby ruby Test_Override.rb
# I am class 1
# I am class 2
