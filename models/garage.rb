module Garage
  extend self
  
  def truck
    Vehicle.new image: "blue_truck.png", step: -1
  end
  
  def car
    Vehicle.new image: "yellow_car.png", step: -1
  end
  
  def sample
    send [ :truck, :car ].sample
  end
  
end