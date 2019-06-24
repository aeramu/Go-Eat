class MapShower
    def initialize(map)
        @map = map
    end
    def Show
        @map.size.times do |i|
            @map.size.times do |j|
                print @map.GetVisual(Position.new(i,j))
            end
            puts
        end
    end
end