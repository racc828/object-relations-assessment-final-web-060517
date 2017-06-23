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
