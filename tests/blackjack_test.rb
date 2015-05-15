require 'minitest/autorun'
require '~/dropbox/workspace/iron_yard/week-2-lab/blackjack'

class BlackJackTest < Minitest::Test
  def test_new_deck
    game = BlackJack.new
    assert_equal 52, game.deck.cards.count
  end

  def test_new_game_shuffle
    game = BlackJack.new
    original = game.deck.cards.dup
    shuffled = game.deck.shuffle_deck
    assert_equal false, original == shuffled
  end

  def test_dealer_first_card
    game = BlackJack.new
    game.dealer.hand << Card.new('Two', 'Spade')
    assert_equal "Two of Spades", game.dealer.first_card.to_s
  end

  def test_hit
    game = BlackJack.new
    game.hit_player
    assert_equal 1, game.player.hand.count
  end

  def test_starting_hand
    game = BlackJack.new
    game.play
    assert_equal true, (game.dealer.hand.count == 2) && (game.player.hand.count == 2)
  end

  def test_dealer_hit_under_17
    game = BlackJack.new
    game.dealer.hand << Card.new('Two', 'Spade')
    game.dealer.hand << Card.new('Two', 'Diamond')
    before = game.dealer.hand_value
    game.hit_dealer
    after = game.dealer.hand_value
    assert_equal true, (after >= 17) && (before == 4)
  end

  def test_bust_21
    game = BlackJack.new
    game.dealer.hand << Card.new('King', 'Spade')
    game.dealer.hand << Card.new('King', 'Spade')
    game.dealer.hand << Card.new('King', 'Spade')
    game.dealer.hand_value
    assert_equal true, game.dealer.bust
  end
end
