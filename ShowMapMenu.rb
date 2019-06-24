class ShowMapMenu
    def initialize(map)
        @map = map
    end
    def Run
        MapShower.new(@map).Show
    end
end