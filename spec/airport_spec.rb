require 'airport'


describe Airport do 
  let(:airport) {Airport.new}

  it 'is created with no planes' do  
    expect(airport.planes).to eq []
  end

  it 'it does not have a bomb alert' do
    expect(airport.bomb_alert).to be_false
  end


  
end