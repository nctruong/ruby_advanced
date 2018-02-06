module RSpec
  module Rails
    module Matchers
      def hello1
        p "hello 1"
      end
    end
  end
end


module RSpec
  module Rails
    module Matchers
      def hello2
        p "hello 2"
      end
    end
  end
end
include RSpec::Rails::Matchers
hello1()
hello2()