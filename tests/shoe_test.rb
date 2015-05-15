require 'minitest/autorun'
require_relative '../shoe'

class ShoeTest < Minitest::Test
  def test_shoe_count
    shoe = Shoe.new
    assert_equal 52 * 7, shoe.cards.count
  end
end
