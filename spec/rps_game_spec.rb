require_relative '../lib/rps_game.rb'

describe RPSGame do
  describe '#initialize' do
    let(:player_double) { double(:player_double, name: "Tom") }
    it "has a computer player_2 by default" do
      game = RPSGame.new(player_double)
      expect(game.player_2.name).to eq("RPS Computer")
    end

    it "has a specified player_1" do
      game = RPSGame.new(player_double)
      expect(game.player_1.name).to eq("Tom")
    end
  end

  describe '#play_rps' do
    let(:player_double) { double(:player_double, name: "Tom", move: "Scissors") }
    let(:computer_double) { double(:computer_double, name: "RPS Computer", computer_move: "Scissors") }
    it "returns draw when player_1 move equals player_2 move" do
      game = RPSGame.new(player_double, computer_double)
      expect(game.play_rps).to eq("It's a draw!")
    end
  end
end
