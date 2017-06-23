class Rating

  attr_accessor :score

  attr_reader :movie, :viewers

  @@all = []

  def initialize(score, movie, viewer)
    @score = score
    @movie = movie
    @viewer = viewer
    @@all << self
  end

  def self.all
    @@all
  end


end
