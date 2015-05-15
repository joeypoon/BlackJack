class Player
  attr_accessor :hand
  attr_reader :bust

  def initialize
    @hand = []
    @bust = false
  end

  def show_hand
    @hand.map { |card| card.to_s }.join(', ') + " Total: #{hand_value}"
  end

  def hand_value
    total = @hand.map { |card| card.value }.reduce(:+)
    if total.nil?
      0
    elsif total > 21
      if soft_hand
        @hand.map { |card| card.value }.reduce(:+)
      else
        @bust = true
        total
      end
    else
      total
    end
  end

  def soft_hand
    @hand.each do |card|
      if card.value == 11
        card.soft_ace
        return true
      end
    end
  end
end
