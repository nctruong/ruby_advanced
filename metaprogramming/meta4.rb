# Override following methods to track methods added. They'll be invoked automatically in runtime
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