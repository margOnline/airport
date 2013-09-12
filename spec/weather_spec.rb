require 'weather'

  describe Weather do 

    let(:conditions) { %w(sunny stormy)}
    let(:weather) {Weather.new(conditions)}

    it 'has no weather contitions' do
      weather = Weather.new []
      expect(weather.conditions).to be_empty
    end

    it 'has weather conditions' do
      expect(weather.conditions).not_to be_empty
    end
  
    it 'returns the forecast' do
      conditions = double Array
      expect(conditions).to receive(:sample)
      weather = Weather.new(conditions)
      weather.forecast
    end
end