require 'minitest/autorun'
require_relative '../score_keeper'

class ScoreKeeperTest < Minitest::Test

  def test_player_win
    score = ScoreKeeper.new
    score.player_win
    assert_equal 1, score.player_score
  end

  def test_dealer_win
    score = ScoreKeeper.new
    score.dealer_win
    assert_equal 1, score.dealer_score
  end

  # def test_reset_score
  #   score = ScoreKeeper.new
  #   score.dealer_win
  # end

end
