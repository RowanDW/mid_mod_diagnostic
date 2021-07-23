class Park
  attr_reader :name, :admission_price, :vehicles
  def initialize(name, admission_price)
    @name = name
    @admission_price = admission_price
    @vehicles = []
  end

  def admit(vehicle)
    @vehicles << vehicle
  end

  def passengers
    @vehicles.flat_map do |vehicle|
      vehicle.passengers
    end
  end

  def revenue
    total_adults = @vehicles.reduce(0) do |acc, vehicle|
      acc += vehicle.num_adults
    end
    total_adults * @admission_price
  end
end
