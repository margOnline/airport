require 'spec_helper'
require 'plane'

  describe Plane do 
  let(:plane) {Plane.new('Harry')}

  it 'has a name' do
    expect(plane.name).to eq 'Harry'
  end

  it 'takes off from airport' do
    airport = double :airport
    airport.should_receive(:take_off).with(plane)
    plane.take_off_from(airport)
  end

  it 'lands at airport' do
    airport = double :airport 
    airport.should_receive(:land).with(plane)
    plane.land_at(airport)
  end
  
end

