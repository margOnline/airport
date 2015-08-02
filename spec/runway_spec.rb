require 'runway'

describe Runway do
let(:runway) {Runway.new('1')}

  it 'has a name' do
    expect(runway.name).to eq '1'
  end

end