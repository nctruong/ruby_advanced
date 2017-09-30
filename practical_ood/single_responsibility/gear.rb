# practice: hide instance variable
# reason: can change what it means by implementing your own version of method.
# example: multiply cog 1 thousand times.
# def cog
#   @cog * 1000
# end

class Gear
  # always warp instance variable in accessor methods instead of directly referring to variable.
  attr_reader :chainring, :cog

  def initialize(chainring, cog)
    @chainring = chainring
    @cog = cog
  end

  def ratio
    chainring / cog.to_f
  end
end