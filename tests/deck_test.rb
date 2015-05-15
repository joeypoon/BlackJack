require 'minitest/autorun'
require_relative '../deck'

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

  def test_shuffle
    deck = Deck.new
    original = deck.cards.dup
    shuffle = deck.shuffle_deck
    assert_equal false, original == shuffle
  end

  def test_draw
    deck = Deck.new
    card = deck.draw
    assert_equal false, deck.cards.include?(card)
  end
end
