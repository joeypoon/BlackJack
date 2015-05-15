require '~/dropbox/workspace/iron_yard/week-2-lab/deck'
require '~/dropbox/workspace/iron_yard/week-2-lab/dealer'

class BlackJack < Deck
  attr_reader :deck, :dealer, :player, :players

  def initialize
    @dealer = Dealer.new
    @player = Player.new
    @deck = Deck.new
    @players = [@dealer, @player]
    @deck.shuffle_deck
  end

  def play
    intro
    initialize
    deal_hands
    menu
  end

  private

    def intro
      puts
      puts "*******************"
      puts "*****BlackJack*****"
      puts "*******************"
      puts "Play a game?  (y/n)"
      puts
      get_play
    end

    def get_play
      @play = gets.chomp.downcase
      intro unless ((@play == 'y') || (@play == 'n'))
      exit if @play == 'n'
    end

    def menu
      puts
      puts "*******************"
      puts "Your hand: #{@player.show_hand}"
      puts "Dealer top card: #{@dealer.first_card}"
      puts "*******************"
      puts "(H)it or (S)tay"
      puts "*******************"
      puts
      get_action
    end

    def get_action
      @action = gets.chomp.downcase
      if @action == 'h'
        hit_player
      elsif @action == 's'
        stay
      else
        menu
      end
    end

    def deal_hands
      players.each do |player|
        player.hand << @deck.cards.shift until player.hand.count == 2
      end
      check_blackjack
    end

    def check_blackjack
      if @dealer.hand_value == 21
        player_lose
      elsif @player.hand_value == 21
        dealer_lose
      end
    end

    def hit_player
      @player.hand << @deck.draw
      @player.hand_value
      if @player.bust
        player_lose
      else
        menu
      end
    end

    def hit_dealer
      @dealer.hand << @deck.draw until @dealer.hand_value >= 17
      dealer_lose if @dealer.bust
    end

    def stay
      hit_dealer
      compare_hands
    end

    def compare_hands
      if @player.hand_value > @dealer.hand_value
        dealer_lose
        play
      else
        player_lose
        play
      end
    end

    def player_lose
      puts score_line
      puts "***You have failed to achieve victory***"
      play
    end

    def dealer_lose
      puts score_line
      puts "***Winner Winner***"
      play
    end

    def score_line
      "Player: #{@player.hand_value} - Dealer: #{@dealer.hand_value}"
    end
end

game = BlackJack.new
game.play
