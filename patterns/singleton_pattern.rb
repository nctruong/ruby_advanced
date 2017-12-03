require 'singleton'
class Will
  include Singleton
  attr_accessor :name
  def greeting
    p "Hello #{name.nil? ? 'Guys' : name}!"
  end
end

Will.instance.greeting
# "Hello Guys!"

class Company
  include Singleton
  def self.welcome
    Will.instance.name = "Will"
    Will.instance.greeting
  end
end

Company.welcome
# "Hello Guys!"
# "Hello Will!"