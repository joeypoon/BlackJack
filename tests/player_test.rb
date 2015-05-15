require 'minitest/autorun'
require_relative '../player'
require_relative '../card'

class PlayerTest < Minitest::Test
  def setup
    @player = Player.new
  end

  def test_hand_value
    player = Player.new
    player.hand << Card.new('Jack', 'Spade')
    assert_equal 10, player.hand_value
  end

  def test_soft_hand
    player = Player.new
    player.hand << Card.new('Jack', 'Spade')
    player.hand << Card.new('King', 'Diamond')
    player.hand << Card.new('Ace', 'Spade')
    assert_equal 21, player.hand_value
  end

  def test_double_ace
    player = Player.new
    player.hand << Card.new('Two', 'Spade')
    player.hand << Card.new('Ace', 'Diamond')
    player.hand << Card.new('Ace', 'Spade')
    assert_equal 14, player.hand_value
  end

  def test_bust
    player = Player.new
    player.hand << Card.new('Jack', 'Spade')
    player.hand << Card.new('King', 'Diamond')
    player.hand << Card.new('Queen', 'Spade')
    player.hand_value
    assert_equal true, player.bust
  end
end
