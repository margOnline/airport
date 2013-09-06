require 'weather'

  describe Weather do 

  let(:weather) {Weather.new}
  
  it 'is randomly set when initialized' do
    weather = double :weather, {:condition => 'sunny'}
    conditions = %w(sunny stormy)
    expect(conditions.sample).to eq weather.condition
  end


  it 'can be sunny' do
    weather.condition = 'sunny'
    expect(weather.is_sunny?).to be_true
  end

  it 'can be stormy' do
    weather.condition = 'stormy'
    expect(weather.is_stormy?).to be_true
  end

  it 'can change' do
    weather.condition = 'stormy'
    expect(weather.change!).to eq 'sunny'
  end

  
end