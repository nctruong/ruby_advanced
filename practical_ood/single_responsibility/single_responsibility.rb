# practice: single responsibility
# example: separate below method because it does two responsibilities
# def diameters
#   wheels.collect {|wheel|
#     wheel.rim + (wheel.tire * 2)}
# end

class RevealingReferences
  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data)
  end

  # first - iterate over the array
  def diameters
    wheels.collect {|wheel| diameter wheel }
  end

  # second - calculate diameter of ONE wheel
  def diameter(wheel)
    wheel.rim +  (wheel.tire * 2)
  end

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect {|cell|
      Wheel.new(cell[0], cell[1])}
  end
end

@data = [[662,20],[662,23],[559,30],[559,40]]
rr = RevealingReferences.new(@data)
p rr.wheels