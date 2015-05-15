require 'minitest/autorun'
require_relative '../dealer'
require_relative '../card'

class DealerTest < Minitest::Test
  def test_first_card
    dealer = Dealer.new
    dealer.hand << Card.new('Two', 'Spade')
    dealer.hand << Card.new('King', 'Spade')
    assert_equal "Two of Spades", dealer.first_card.to_s
  end
end
