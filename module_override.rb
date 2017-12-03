module A
  def hello1
    p "hello 1"
  end
end

module A
  def hello2
    p "hello 2"
  end
end

include A
hello1