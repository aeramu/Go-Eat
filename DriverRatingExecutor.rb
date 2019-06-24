class DriverRatingExecutor
    def initialize(driver,map)
        @driver = driver
        @map = map
    end
    def Execute
        if(@driver.rating<3)
            @map.Delete(@driver.position)
            Driver.list.delete(@driver)
        end
    end
end