require './lib/vehicle'
require './lib/passenger'

RSpec.describe Vehicle do
  context 'Initialize' do
    it 'exists' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      expect(vehicle).to be_a(Vehicle)
    end

    it 'has a year' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      expect(vehicle.year).to eq("2001")
    end

    it 'has a make' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      expect(vehicle.make).to eq("Honda")
    end

    it 'has a model' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      expect(vehicle.model).to eq("Civic")
    end

    it 'starts out not speeding' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      expect(vehicle.speeding?).to be false
    end

    it 'starts out with no passengers' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      expect(vehicle.passengers).to eq([])
    end
  end

  context 'Methods' do
    it 'can speed' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      expect(vehicle.speeding?).to be false
      vehicle.speed
      expect(vehicle.speeding?).to be true
    end

    it 'can add passengers' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)
      expect(vehicle.passengers).to eq([charlie, jude, taylor])
    end

    it 'can determine the number of adult passengers' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})
      
      expect(vehicle.num_adults).to eq(0)
      vehicle.add_passenger(charlie)
      expect(vehicle.num_adults).to eq(1)
      vehicle.add_passenger(jude)
      expect(vehicle.num_adults).to eq(2)
      vehicle.add_passenger(taylor)
      expect(vehicle.num_adults).to eq(2)
    end
  end
end
