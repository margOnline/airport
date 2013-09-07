require 'plane'

  describe Plane do 
  let(:plane) {Plane.new('Harry')}

  it 'has a name' do
    expect(plane.name).to eq 'Harry'
  end

  it 'can take_off' do
    airport = double :airport, {:permission_given_to_take_off? => true}
    plane.take_off?(airport).should be_true
  end

  it 'can land' do
    airport = double :airport, {:permission_given_to_land? => true}
    plane.land?(airport).should be_true
  end

  context 'if permmission not given by airport' do
    it 'does not take_off' do
      airport = double :airport, {:permission_given_to_take_off? => false}
      plane.take_off?(airport).should be_false
    end

    it 'does not land' do
      airport = double :airport, {:permission_given_to_land? => false}
      plane.land?(airport).should be_false
    end
  end

  context 'calls the airport for permission to' do
    it 'take_off' do
      airport = double :airport
      airport.should_receive(:permission_given_to_take_off?)
      plane.take_off?(airport)
    end

    it 'land' do
      airport = double :airport 
      airport.should_receive(:permission_given_to_land?)
      plane.land?(airport)
    end
  end
  
end

