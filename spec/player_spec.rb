require_relative '../lib/player.rb'

describe Player do
  describe '#initialize' do
    it "should initialize with a name attribute" do
      tom = Player.new("Tom")
      expect(tom.name).to eq("Tom")
    end
  end
end
