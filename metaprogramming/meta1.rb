# demo [instance, module, class]_eval
class Thing
end

# for instance
Thing.instance_eval do
  def instance_eval_custom
    puts "instance eval custom"
  end

  def self.instance_class_eval_custom
    puts "instance class eval custom"
  end
end

# for module
Thing.module_eval do
  def hello
    puts "Hello there!"
  end
end

# for class
Thing.class_eval do
  def self.self_class_eval_custom
    puts "self class_eval_custome"
  end

  def instance_class_eval_custom
    puts "instance class_eval_custome"
  end
end

# module method
t = Thing.new
t.hello()

# class method & instance method
Thing.self_class_eval_custom
t.instance_class_eval_custom

# 5.
# - primitive data type which the language can then make sense of.
# - write string but return code
puts eval "7 * 6"
eval("def eval_method; 99; end")
puts eval_method

# => different contexts but usage are the same