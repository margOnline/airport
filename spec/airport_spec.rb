require 'airport'


describe Airport do 
  let(:airport) {Airport.new()}

  it 'is created with no planes' do 
    expect(airport.planes).to eq []
  end

  it 'has a weather condition' do
    weather = double :weather
    expect(airport.weather).to be_true
  end

  it 'does not have a bomb alert' do
    expect(airport.bomb_alert?).to be_false
  end

  it 'does have a bomb alert' do
    airport = Airport.new(:planes, true)
    expect(airport.bomb_alert?).to be_true
  end

  it 'can set a bomb_alert' do
    airport = Airport.new(:planes)
    airport.bomb_alert!
    expect(airport.bomb_alert).to be_true
  end

  it 'can clear a bomb_alert' do
    airport = Airport.new(:planes, true)
    airport.clear_bomb_alert!
    expect(airport.bomb_alert).to be_false
  end
  
end