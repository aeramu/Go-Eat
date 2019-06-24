class HashToStore
    def initialize(hash)
        @hash = hash
    end
    def result
        Store.new(@hash["name"],
            HashToPosition.new(@hash["position"]).result,
            HashToItems.new(@hash["items"]).result)
    end
end