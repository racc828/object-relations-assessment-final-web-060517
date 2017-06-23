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
