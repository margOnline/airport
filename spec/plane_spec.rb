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





  
end

