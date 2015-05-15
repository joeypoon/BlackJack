require 'minitest/autorun'
require '~/dropbox/workspace/iron_yard/week-2-lab/card'

class CardTest < Minitest::Test
  def test_value
    card = Card.new('Jack', 'Spade')
    assert_equal 10, card.value
  end

  def test_card
    card = Card.new('Jack', 'Spade')
    assert_equal "Jack of Spades", card.to_s
  end

  def test_soft_ace
    card = Card.new('Ace', 'Spade')
    card.soft_ace
    assert_equal 1, card.value
  end

  def test_hard_ace
    card = Card.new('Ace', 'Spade')
    card.hard_ace
    assert_equal 11, card.value
  end

  def test_suit
    card = Card.new('Ace', 'Heart')
    assert_equal :Heart, card.suit
  end
end
