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
        self.RatingCheck
        @rating
    end
    def RatingCheck
        if(@rating<3)
            i=0
            @@list.each do |driver|
                if driver.object_id == self.object_id
                    @@list.delete_at(i)
                end
                i+=1
            end
        end
        if @@list.empty?
            puts "Mencari Driver..."
            $map.Add(RandomGenerator.Driver($map).object_id)
        end
    end
    def to_hash
        hash = Hash.new()
        hash["name"] = @name
        hash["position"] = @position.to_hash
        hash["rating"] = @rating
        hash["ratedBy"] = @ratedBy
        hash
    end
end