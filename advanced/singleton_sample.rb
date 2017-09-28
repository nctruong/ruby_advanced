# 2 instances are from the same class
# 1 instance has say_hello method but another not.

# it's like meta programming.
# class_eval, instance_eval, module_eval: just can be used for class Name (meta1.rb)
# this is the way we call it singleton: adding method to a instance (not to class context)
class Zen
end

z1 = Zen.new
z2 = Zen.new

class << z1
  def say_hello
    puts "Hello! (class << z1)"
  end
end

z1.say_hello    # Output: Hello!

begin
  z2.say_hello    # undefined method `say_hello'
rescue => e
  p e.to_s
end

class << z2
  def say_hello
    puts "Hello! (class << z2)"
  end
end

z2.say_hello