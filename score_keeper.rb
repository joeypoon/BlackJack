class ScoreKeeper
  attr_reader :dealer_score, :player_score

  def initialize
    read_scores
  end

  def player_win
    @player_score += 1
  end

  def dealer_win
    @dealer_score += 1
  end

  def read_scores
    file = File.read('scores.csv')
    scores = file.split(',')
    @dealer_score = scores[0].to_i
    @player_score = scores[1].to_i
  end

  def write_scores
    File.open('scores.csv', 'w') do |line|
      line << "#{@dealer_score},#{@player_score}"
    end
  end

  def reset_scores
    File.open('scores.csv', 'w') do |line|
      line << "0,0"
    end
  end

end
