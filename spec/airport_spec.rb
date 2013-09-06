require 'airport'


describe Airport do 
  let(:airport) {Airport.new(5)}

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

  it 'can have a bomb alert' do
    airport = Airport.new(5, :planes, true)
    expect(airport.bomb_alert?).to be_true
  end

  it 'can set a bomb_alert' do
    airport = Airport.new(5, :planes)
    airport.bomb_alert!
    expect(airport.bomb_alert).to be_true
  end

  it 'can clear a bomb_alert' do
    airport = Airport.new(5, :planes, true)
    airport.clear_bomb_alert!
    expect(airport.bomb_alert).to be_false
  end

  it 'knows if it is full' do
    airport = Airport.new(0)
    expect(airport.full?).to be_true
  end

  it 'knows if it has spaces to land planes' do
    expect(airport.has_capacity?).to be_true
  end

  it 'lands planes if there is no bomb_alert' do
    weather = double :weather
    plane = double :plane
    expect(airport.land plane).to eq [plane]
  end

  it 'does not land planes if there is a bomb_alert' do
    airport = Airport.new(0, [], true)
    weather = double :weather
    plane = double :plane
    expect{airport.land(plane)}.to raise_error 'Permission denied due to security alert'
  end

  it 'lands planes if there is space in the airport' do
    plane = double :plane
    expect(airport.land plane).to eq [plane]
  end

  it 'does not land planes if there is no space' do
    # weather = double :weather
    plane = double :plane
    airport = Airport.new(0)
    expect{airport.land plane }.to raise_error 'Permission denied - airport full'
  end

  it 'lands planes if the weather is sunny' do
    weather = double :weather, {:condition => 'sunny'}
    plane = double :plane
    expect(airport.land plane).to eq [plane]
  end

  it 'does not land planes if the weather is stormy' do
    weather = double :weather, {:condition => 'stormy'}
    plane = double :plane
    expect{airport.land(plane)}.to raise_error 'Permission denied - poor weather conditions'
  end

  it 'lets a plane take off if there is one' do
    plane = double :plane
    airport = Airport.new(5, [plane], false)
    expect(airport.land(plane)).to eq []
  end

  it 'does not let a plane take off if there are no planes' do
      airport = Airport.new(5, [], false)
      plane = double :plane
      expect{airport.land(plane)}.to raise_error 'No planes in the airport'
  end

  it 'lets planes take off if there is no bomb_alert' do
    plane = double :plane
    weather = double :weather, {:condition => 'sunny'}
    expect(airport.land plane).to eq [plane]
  end

  it 'does not let planes take off if there is a bomb_alert' do
    airport = Airport.new(0, [], true)
    weather = double :weather, {:condition => 'sunny'}
    plane = double :plane
    expect{airport.land(plane)}.to raise_error 'Permission denied due to security alert'
  end

  it 'lets planes take off if the weather is sunny' do
    weather = double :weather, {:condition => 'sunny'}
    plane = double :plane
    expect(airport.land plane).to eq [plane]
  end

  it 'does not let planes take off if the weather is stormy' do
    weather = double :weather, {:condition => 'stormy'}
    plane = double :plane
    expect{airport.land(plane)}.to raise_error 'Permission denied - poor weather conditions'
  end

  
end