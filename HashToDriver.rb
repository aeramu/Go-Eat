class HashToDriver
    def initialize(hash)
        @hash = hash
    end
    def result
        Driver.new(@hash["name"],
            HashToPosition.new(@hash["position"]).result,
            @hash["rating"],@hash["ratedBy"])
    end
end