class RandomStoreGenerator
    def initialize(map)
        @map = map
    end
    def Generate
        position = RandomPositionGenerator.new(@map.size).Generate
        while @map.GetObject(position).class != NilClass
            position = RandomPositionGenerator.new(@map.size).Generate
        end
        Store.new("Nasgor Bang Jali",position,[Item.new("Nasi Goreng",10000),Item.new("Es Teh Manis",3000)])
    end
end