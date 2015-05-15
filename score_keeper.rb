require 'csv'

class ScoreKeeper
  attr_reader :scores

  def initialize
    @scores = {
      Dealer: 0
      Player: 0
    }
  end

  def read_scores
    unless File.zero?('scores.csv')
      CSV.read('scores.csv', headers: true) do |line|
        @scores[:Dealer] = line.to_hash["Dealer"].to_i
        @scores[:Player] = line.to_hash[" Player"].to_i
      end
    end
  end

  def write_scores
    File.write('score.csv', text.gsub) do |line|
      line.to_hash['Dealer'] = @dealer_wins
      line.to_hash[' Player'] = @player_wins
    end
  end

  def reset_scores
  end

end
