def class_from_string(str)
  str.split('::').inject(Object) do |mod, class_name|
    mod.const_get(class_name)
  end
end

class A
  def self.say
    p "hello"
  end
end

(class_from_string "A").say