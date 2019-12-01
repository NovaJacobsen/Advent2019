class SpaceModule

  def initialize(mass)
    @mass = mass
  end

  def fuel_cost
    (@mass / 3) - 2
  end

end
