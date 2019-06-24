class Driver
    @@list = Array.new
    attr_accessor :name, :position, :rating, :ratedBy
    def initialize(name, position, rating, ratedBy)
        @name = name
        @position = position
        @rating = rating
        @ratedBy = ratedBy
        @@list << self
    end
    def self.list
        @@list
    end
    def Rate(rate)
        @rating=((@rating*@ratedBy)+rate.to_f)/(@ratedBy+1)
        @ratedBy+=1
    end
end