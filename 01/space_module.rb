class SpaceModule

  def initialize(mass)
    @mass = mass
  end

  def fuel_cost(mass = @mass)
    (mass / 3) - 2
  end

  def fuel_total
    mass = @mass
    fuel = 0
    new_fuel = fuel_cost(mass)
    while new_fuel > 0
      fuel += new_fuel
      new_fuel = fuel_cost(new_fuel)
    end
    fuel
  end

end
