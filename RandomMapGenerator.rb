class RandomMapGenerator
    def initialize(map)
        @map = map
    end
    def Generate
        3.times do
            @map.Add(RandomStoreGenerator.new(@map).Generate)
        end
        5.times do
            @map.Add(RandomDriverGenerator.new(@map).Generate)
        end
        @map
    end
end