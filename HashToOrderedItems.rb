class HashToOrderedItems
    def initialize(hash)
        @hash = hash
    end
    def result
        orderedItems = Hash.new()
        @hash.each do |hash|
            orderedItems[HashToItem.new(hash["key"]).result] = hash["value"]
        end
        orderedItems    
    end
end