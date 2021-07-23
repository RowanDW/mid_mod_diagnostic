require './lib/park'
require './lib/vehicle'
require './lib/passenger'

RSpec.describe Park do
  context "initialize" do
    it 'exists' do
      park = Park.new("Yosemite", 5)
      expect(park).to be_a(Park)
    end

    it 'has a name' do
      park = Park.new("Yosemite", 5)
      expect(park.name).to eq("Yosemite")
    end

    it 'has an admission price' do
      park = Park.new("Yosemite", 5)
      expect(park.admission_price).to eq(5)
    end

    it 'starts with no vehicles in the park' do
      park = Park.new("Yosemite", 5)
      expect(park.vehicles).to eq([])
    end
  end

  context "Methods" do
    it 'can admit vehicles to the park' do
      park = Park.new("Yosemite", 5)
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      park.admit(vehicle)
      expect(park.vehicles).to eq([vehicle])
    end

    it 'can list all passengers in the park' do
      park = Park.new("Yosemite", 5)
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)
      park.admit(vehicle)

      expect(park.passengers).to eq([charlie, jude, taylor])
    end

    it 'can calculate revenue' do
      park = Park.new("Yosemite", 5)
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)
      park.admit(vehicle)

      expect(park.revenue).to eq(10)
    end
  end
end
