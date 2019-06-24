class ItemsToHash
    def initialize(items)
        @items = items
    end
    def result
        items = Array.new()
        @items.each do |item|
            items << ItemToHash.new(item).result
        end
        items
    end
end