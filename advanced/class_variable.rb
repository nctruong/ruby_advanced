# demonstrating the way to implement configuration in rails

class ClassVariable
  attr_accessor :name # using "=", not set_name

  def initialize
    @name = "init"
  end

  # Returns the global object
  def self.configuration
    @configuration ||= ClassVariable.new
  end

  def self.configure
    # implicit understanding: in a class method only calling other class method.
    # means: self.configuration as below
    yield configuration if block_given?
  end
end

ClassVariable.configure do |config|
  p config.name = "New name: Truong"
end