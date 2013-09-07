require 'airport'


describe Airport do 
  let(:airport) {Airport.new('Logan',5)}

  it 'has a name'  do
    expect(airport.name).to eq 'Logan'
  end

  it 'is created with no planes' do 
    expect(airport.planes).to eq []
  end

  context 'weather is' do
    it 'sunny' do
      weather = double :weather, {:condition => 'sunny'}
      conditions = %w(sunny stormy)
      expect(conditions.include?(weather.condition)).to be_true
    end

    it 'stormy' do
      weather = double :weather, {:condition => 'stormy'}
      conditions = %w(sunny stormy)
      expect(conditions.include?(weather.condition)).to be_true
    end
   end 

  context 'security' do
    it 'has no bomb alert' do
      expect(airport.bomb_alert?).to be_false
    end

    it 'has bomb alert' do
      airport = Airport.new('Logan', 5, :planes, true)
      expect(airport.bomb_alert?).to be_true
    end

    it 'raises bomb_alert' do
      airport = Airport.new('Logan',5, :planes)
      airport.bomb_alert!
      expect(airport.bomb_alert).to be_true
    end

    it 'clears bomb_alert' do
      airport = Airport.new('Logan',5, :planes, true)
      airport.clear_bomb_alert!
      expect(airport.bomb_alert).to be_false
    end
   end 

   context 'capacity:' do
    it 'is full' do
      airport = Airport.new('Logan',0)
      expect(airport.full?).to be_true
    end

    it 'is not full' do
      expect(airport.has_capacity?).to be_true
    end
   end 

  it 'lands planes if there is no bomb_alert' do
    weather = double :weather
    plane = double :plane
    expect(airport.land plane).to eq [plane]
  end

  it 'does not land planes if there is a bomb_alert' do
    airport = Airport.new('Logan',0, [], true)
    weather = double :weather
    plane = double :plane
    expect{airport.land(plane)}.to raise_error 'Permission denied due to security alert'
  end

  it 'lands planes if there is space in the airport' do
    plane = double :plane
    expect(airport.land plane).to eq [plane]
  end

  it 'does not land planes if there is no space' do
    plane = double :plane
    plane1 = double :plane
    airport = Airport.new('Logan',1, [plane])
    expect{airport.land plane1 }.to raise_error 'Permission denied - airport full'
  end

  it 'lands planes if the weather is sunny' do
    plane = double :plane
    expect(airport.land plane).to eq [plane]
  end

  it 'does not land planes if the weather is stormy' do
    weather = double :weather, {:is_stormy? => true}
    plane = double :plane
    expect{airport.land(plane)}.to raise_error 'Permission denied - poor weather conditions'
  end

  it 'lets a plane take off if there is one' do
    plane = double :plane
    airport = Airport.new('Logan',5, [plane], false)
    expect(airport.take_off(plane)).to eq []
  end

  it 'does not let a plane take off if there are no planes' do
      airport = Airport.new('Logan',5, [], false)
      plane = double :plane
      expect{airport.take_off(plane)}.to raise_error 'Permission denied - no planes in the airport'
  end

  it 'lets planes take off if there is no bomb_alert' do
    plane = double :plane
    airport = Airport.new('Logan',5, [plane])
    expect(airport.take_off plane).to eq []
  end

  it 'does not let planes take off if there is a bomb_alert' do
    airport = Airport.new('Logan',0, [], true)
    plane = double :plane
    expect{airport.take_off(plane)}.to raise_error 'Permission denied due to security alert'
  end

  it 'lets planes take off if the weather is sunny' do
    plane = double :plane
    airport = Airport.new('Logan',5,[plane])
    expect(airport.take_off plane).to eq []
  end

  it 'does not let planes take off if the weather is stormy' do
    plane = double :plane
    weather1 = double :weather,{:is_stormy? => true}
    airport = Airport.new('Logan', 5,[plane])
    airport.weather = 'stormy'
    expect{airport.take_off(plane)}.to raise_error 'Permission denied - poor weather conditions'
  end


  
end