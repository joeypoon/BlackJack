require 'minitest/autorun'
require '~/dropbox/workspace/iron_yard/week-2-lab/dealer'
require '~/dropbox/workspace/iron_yard/week-2-lab/card'

class DealerTest < Minitest::Test
  def test_first_card
    dealer = Dealer.new
    dealer.hand << Card.new('Two', 'Spade')
    dealer.hand << Card.new('King', 'Spade')
    assert_equal "Two of Spades", dealer.first_card.to_s
  end
end
