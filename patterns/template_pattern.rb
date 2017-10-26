class Report
  # abstract method
  def output_start
    raise 'Called abstract method: output_start'
  end
end

class Creature
  # hook method
  def make_sound sound

  end
end

class Human < Creature
  def singing(lyric)
    make_sound lyric
  end

  def dancing(_type)
    make_sound "I'm dancing #{_type}"
  end
end