class Driver
    @@list = Array.new
    attr_accessor :rating, :position, :name
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
    def Rating(rate)
        @rating=((@rating*@ratedBy)+rate)/(@ratedBy+1)
        @ratedBy+=1
    end
end