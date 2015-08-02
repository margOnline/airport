require 'spec_helper'
require 'weather'

  describe Weather do 

    let(:conditions) { %w(sunny stormy)}
    let(:weather) {Weather.new()}

    it 'has weather conditions' do
      expect(weather.conditions).not_to be_empty
    end
  
    it 'returns the forecast' do
      expect(weather.conditions).to receive(:sample)
      weather.forecast
    end

    it 'changes to sunny' do
      weather.sunny!
      expect(weather.condition).to eq 'sunny'
    end

    it 'changes to stormy' do
      weather.stormy!
      expect(weather.condition).to eq 'stormy'
    end
end