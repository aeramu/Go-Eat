class DriverToHash
    def initialize(driver)
        @driver = driver
    end
    def result
        Hash["name",@driver.name,
            "position",PositionToHash.new(@driver.position).result,
            "rating",@driver.rating,
            "ratedBy",@driver.ratedBy]
    end
end