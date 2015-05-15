require '~/dropbox/workspace/iron_yard/week-2-lab/deck'
require '~/dropbox/workspace/iron_yard/week-2-lab/dealer'

# don't consider Aces as possible 1's ... they are always 11s
# This is a 2 hand game (dealer and player)
# no splitting or funny business
# 1 deck in the game
# 52 card deck
# NO WILDS
# New deck every game
# deck must be shuffled every game
# no betting at all
# must have suits (ace of diamonds)
# Dealer hits if less than 16, otherwise dealer stays
# You enter what you play
# No if you get 5 cards you win funnybusiness
# get as close to 21 without going over
# Must beat the dealer
# you can see 1 of dealers cards, while you are playing
# If you get blackjack, you win automagically

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

  def hit_player
    @player.hand << @deck.draw
    @player.hand_value
  end

  def hit_dealer
    @dealer.hand << @deck.draw until @dealer.hand_value >= 17
  end

  private

    def intro
      puts "*******************"
      puts "*****BlackJack*****"
      puts "*******************"
      puts "Play a game?  (y/n)"
      get_play
    end

    def get_play
      @play = gets.chomp.downcase
      intro unless ((@play == 'y') || (@play == 'n'))
      exit if @play == 'n'
    end

    def get_action
      @action = gets.chomp.downcase
      if @action == 'h'
        hit_player
      elsif @action == 's'
      else
        menu
      end
    end

    def menu
      puts "*******************"
      puts "Your hand: #{@player.show_hand}"
      puts "Dealer top card: #{@dealer.first_card}"
      puts "*******************"
      puts "(H)it or (S)tay"
      puts "*******************"
      get_action
    end

    def deal_hands
      players.each do |player|
        player.hand << @deck.cards.shift until player.hand.count == 2
      end
      check_blackjack
    end

    def check_blackjack
      if @dealer.hand_value == 21
        puts "Dealer BlackJack :sadface"
        play
      elsif @player.hand_value == 21
        puts "BlackJack!!1one!1!two"
        play
      end
    end
end

game = BlackJack.new
game.play
