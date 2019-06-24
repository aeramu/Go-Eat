class DriverAroundChecker
    def initialize(map)
        @map = map
    end
    def Check
        if Driver.list.empty?
            puts "Mencari Driver..."
            @map.Add(RandomDriverGenerator.new(@map).Generate)
        end
    end
end