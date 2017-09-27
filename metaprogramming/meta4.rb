# When doing any metaprogramming, tracking changes to the runtime is a problem
# that you will encounter sooner or later.
class Dojo
  @@methods_removed = []
  # Invoked as a callback whenever an instance method is added to the receiver.
  def self.method_added(method_name)
    puts "#{method_name} added to #{self}"
  end

  def self.methods_removed name
    @@methods_removed << name
  end

  def self.method_added_custom(method_name)
    puts "#{method_name} added to #{self}"
  end

  def a_kata
  end

  def another_kata
  end
end