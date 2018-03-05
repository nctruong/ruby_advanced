
class A
  module ClassMethods
    def test
      p "test"
    end
  end
  extend ClassMethods
end

A.test