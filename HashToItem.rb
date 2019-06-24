class HashToItem
    def initialize(hash)
        @hash = hash
    end
    def result
        Item.new(@hash["name"],@hash["price"])
    end
end