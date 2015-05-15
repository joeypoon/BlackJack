require 'minitest/autorun'
require '~/dropbox/workspace/iron_yard/week-2-lab/player'
require '~/dropbox/workspace/iron_yard/week-2-lab/card'

class PlayerTest < Minitest::Test
  def setup
    @player = Player.new
  end

  def test_hand_value
    player = Player.new
    player.hand << Card.new('Jack', 'Spade')
    assert_equal 10, player.hand_value
  end
end
