# practice: remove argument order by using hash
class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(*args)
    @chainring  = args[:chainring]
    @cog        = args[:cog]
    @wheel      = args[:wheel]
  end
end

Gear.new(
    :chainring => 52,
    :cog => 11,
    :wheel => 12
)

