class HashToItems
    def initialize(hash)
        @hash = hash
    end
    def result
        items = Array.new()
        @hash.each do |item|
            items << HashToItem.new(item).result
        end
        items
    end
end