class RandomGenerator
    def self.Position(max)
        Position.new(rand(max),rand(max))
    end
    def self.String(length)
        (0...length).map {(65+rand(26)).chr}.join
    end
    def self.Driver(map)
        position = Position(map.size)
        while map.GetObject(position).class != NilClass
            position = Position(map.size)
        end
        Driver.new(String(8),position,0,0)
    end
    def self.Store(map)
        position = Position(map.size)
        while map.GetObject(position).class != NilClass
            position = Position(map.size)
        end
        Store.new(String(8),position,[Item(50),Item(50),Item(50)])
    end
    def self.Item(price)
        Item.new(String(8), 5000+rand(price)*1000)
    end
    def self.Map(map)
        3.times do
            map.Add(Store(map).object_id)
        end
        5.times do
            map.Add(Driver(map).object_id)
        end
        map
    end
end