require 'minitest/autorun'
require './deck'

class DeckTest < Minitest::Test
  def setup
    @deck = Deck.new
  end

  def test_52_cards
    assert_equal 52, @deck.cards.count
  end

  def test_4_Aces
    aces = @deck.cards.select { |card| card.card == :Ace }
    assert_equal 4, aces.count
  end

  def test_13__spades
    spades = @deck.cards.select { |card| card.suit == :Spade }
    assert_equal 13, spades.count
  end
end
