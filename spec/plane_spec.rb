require 'plane'

  describe Plane do 
  let(:plane) {Plane.new}

  it 'can take_off' do
    airport = double :airport, {:permission_given_to_take_off? => true}
    plane.take_off?(airport).should be_true
  end

  it 'does not take_off if permmission not given by airport' do
    airport = double :airport, {:permission_given_to_take_off? => false}
    plane.take_off?(airport).should be_false
  end

  it 'can land' do
    airport = double :airport, {:permission_given_to_land? => true}
    plane.land?(airport).should be_true
  end

  it 'does not land if permmission not given by airport' do
    airport = double :airport, {:permission_given_to_land? => false}
    plane.land?(airport).should be_false
  end

  it 'calls the airport for permission to take take_off' do
    airport = double :airport
    airport.should_receive(:permission_given_to_take_off?)

    plane.take_off?(airport)
  end

  it 'calls airport for permission to land' do
    airport = double :airport 
    airport.should_receive(:permission_given_to_land?)
    plane.land?(airport)
  end

    # van = double :van, {:fill  => fixed_bikes}
    # van.should_receive(:fill).with(fixed_bikes)
    # garage.call_van(van, fixed_bikes)

  
end

