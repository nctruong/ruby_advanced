# practice: hide data structure
class RevealingReferences
  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameters
    wheels.collect {|wheel|
      wheel.rim + (wheel.tire * 2)}
  end

  # For understanding the structure of incoming array. We can't just look at the index and
  # understand what it means.
  # Using Struct class to wrap structure.
  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect {|cell|
      Wheel.new(cell[0], cell[1])}
  end
end

@data = [[662,20],[662,23],[559,30],[559,40]]
rr = RevealingReferences.new(@data)
p rr.wheels