class RateDriver
    def initialize(driver)
        @driver = driver
    end
    def Run
        print "Rating(0-5): "
        userInput = gets.chomp.to_f
        @driver.Rate(userInput)
    end
end