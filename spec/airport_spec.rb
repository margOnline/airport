require 'spec_helper'
require 'airport'
require 'plane'

describe Airport do 
  let(:airport) {Airport.new('Logan',5)}
  let(:weather) {double :weather}

  it 'has a name'  do
    expect(airport.name).to eq 'Logan'
  end

  it 'is created with no planes' do 
    expect(airport.planes).to eq []
  end

  context 'weather is' do
    it 'sunny' do
      weather = double :weather, {condition: 'sunny'}
      conditions = %w(sunny stormy)
      expect(conditions.include?(weather.condition)).to be_true
    end

    it 'stormy' do
      weather = double :weather, {condition: 'stormy'}
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

  context 'capacity' do
    it 'is full' do
      airport = Airport.new('Logan',0)
      expect(airport.full?).to be_true
    end

    it 'is not full' do
      expect(airport.has_capacity?).to be_true
    end
   end 

  context 'lands planes if' do
    
    it 'permission is given to land' do
      plane = double :plane
      airport.stub(permission_given_to_land?: true)
      expect{airport.land plane}.to change(airport.planes, :count).by(1)
    end

    it 'weather is sunny' do
      airport.weather = double :weather, {condition: 'sunny'}
      plane = double :plane
      expect{airport.land plane}.to change(airport.planes, :count).by(1)
    end

    it 'has capacity' do
      airport.weather = double :weather, {condition: 'sunny'}
      plane = double :plane
      expect{airport.land plane}.to change(airport.planes, :count).by(1)
    end
   end 

  context 'does not land planes if' do 
    it 'bomb_alert' do
      airport = Airport.new('Logan',0, [], true)
      plane = double :plane
      expect(airport.land(plane)).to be_false
    end

    it 'weather is stormy' do
      weather = double :weather, {condition: 'stormy'}
      plane = double :plane
      airport.weather = weather
      expect(airport.land(plane)).to be_false
    end

    it 'at full capacity' do
      plane = double :plane
      plane1 = double :plane
      airport = Airport.new('Logan',1, [plane])
      expect(airport.land plane1).to be_false 
    end
   end 

  context 'takes off planes if' do
    it 'no bomb_alert' do
      plane = double :plane
      airport = Airport.new('Logan',5, [plane])
      airport.weather = double :weather, {condition: 'sunny'}
      expect{airport.take_off plane}.to change(airport.planes, :count).by(-1)
    end

    it 'weather is sunny' do
      plane = double :plane
      airport = Airport.new('Logan',5,[plane])
      airport.weather = double :weather, {condition: 'sunny'}
      expect{airport.take_off plane}.to change(airport.planes, :count).by(-1)
    end

    it 'plane is in airport' do
      plane = double :plane
      airport = Airport.new('Logan',5, [plane])
      airport.weather = double :weather, {condition: 'sunny'}
      expect{airport.take_off(plane)}.to change(airport.planes, :count).by(-1)
    end
   end 

  context 'does not take off planes if' do
    it 'bomb_alert' do
      airport = Airport.new('Logan',0, [], true)
      plane = double :plane
      expect(airport.take_off(plane)).to be_false
    end    

    it 'weather is stormy' do
      plane = double :plane
      airport = Airport.new('Logan',5, [plane])
      weather = double :weather, {condition: 'stormy'}
      airport.weather = weather
      expect(airport.take_off(plane)).to be_false
    end
  end

  describe 'landing permission' do
    it 'is not given if there is a bomb alert' do
      airport.bomb_alert!
      expect(airport.land(double(:plane))).to be_false
    end
  end

end