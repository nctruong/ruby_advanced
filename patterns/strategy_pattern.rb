class Creature
  def make_sound sound
    raise NotImplementedError, 'Ask the subclass'
  end
end

class Human < Creature
  def make_sound sound
    p sound
  end

  def singing(lyric)
    make_sound lyric
  end

  def dancing(_type)
    make_sound "I'm dancing #{_type}"
  end
end

class Student
  attr_accessor :human

  def initialize human
    @human = human
  end
  def singing_dancing_hello
    human.singing "Hello! This is me you're looking for."
    human.dancing "poping"
  end
end

student = Student.new Human.new
student.singing_dancing_hello