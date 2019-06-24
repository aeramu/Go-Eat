class OrderedItemsToHash
    def initialize(orderedItems)
        @orderedItems = orderedItems
    end
    def result
        orderedItems = Array.new()
        @orderedItems.each do |item,count|
            itemHash = Hash.new()
            orderedItems << Hash["key",ItemToHash.new(item).result,
                "value",count]
        end
        orderedItems
    end
end