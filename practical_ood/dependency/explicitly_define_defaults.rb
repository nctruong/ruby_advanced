# practice: explicitly define defaults
class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(*args)
    @chainring  = args[:chainring] || 40 # nil or false
    @cog        = args.fetch(:cog, 18) # key is not in hash.
    @wheel      = args[:wheel]

    args = defaults.merge(args) # merge if their keys are in the hash - like fetch
  end

  def defaults
    {:a => 1, :b => 2}
  end
end


