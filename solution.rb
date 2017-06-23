# Please copy/paste all three classes into this file to submit your solution!

class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    self.all.find do |movie_obj|
      movie_obj.title == title
    end
  end

  def ratings
    Rating.all.select do |rating|
      rating.movie == self
    end
  end

  def viewers
    ratings.map do |rating|
      rating.viewer
    end
  end

  def average_rating

    sum = 0

    ratings.map do |rating|
      sum += rating.score
    end

    sum / ratings.size

  end

end

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

class Viewer
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find do |viewer_obj|
      viewer_obj.name == name
    end
  end

  def create_rating(score, movie)
    Rating.new(score, movie, self)
  end

end
