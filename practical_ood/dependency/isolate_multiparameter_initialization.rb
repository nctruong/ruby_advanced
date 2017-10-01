module SomeFramework
  class Gear
    attr_reader :chainring, :cog, :wheel
    def initialize(chainring, cog, wheel)
      @chainring = chainring
      @cog = cog
      @wheel = wheel
    end
    # ...
  end
end

# wrap the interface to protect yourself from changes
# write your own method to change fix-argument to hash without changing the original class.
module GearWrapper
  def self.gear(args)
    SomeFramework::Gear(args[:chainring], args[:cog], args[:wheel])
  end
end

# Now you can create a new Gear using an arguments hash
GearWrapper.gear(
  :chainring => 52,
  :cog => 11,
  :wheel => 12
)