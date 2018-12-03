require 'rails_helper'

RSpec.describe Duel, type: :model do
  describe '#winner' do
    context 'when a completed duel' do
      let(:player_one) { build(:chandler) }
      let(:player_two) { build(:monica) }

      context 'with player one the winner' do
        let(:p1_winner_duel) { build(:p1_winner_duel, player_one: player_one, player_two: player_two) }

        it 'returns the user with the highest life points' do
          expect(p1_winner_duel.winner).to eql(player_one)
        end
      end

      context 'with player two the winner' do
        let(:p2_winner_duel) { build(:p2_winner_duel, player_one: player_one, player_two: player_two) }

        it 'returns the user with the highest life points' do
          expect(p2_winner_duel.winner).to eql(player_two)
        end
      end
    end

    context 'when a started duel' do
      let(:started_duel) { build(:started_duel) }

      it 'returns an error' do
        started_duel.winner
        expect(started_duel.errors[:winner].size).to eq(1)
      end
    end

    context 'when a cancelled duel' do
      let(:cancelled_duel) { build(:cancelled_duel) }

      it 'returns an error' do
        cancelled_duel.winner
        expect(cancelled_duel.errors[:winner].size).to eq(1)
      end
    end
  end
end
