class ItemsShower
    def initialize(items)
        @items = items
    end
    def Show
        puts "Daftar makanan atau minuman: "
        i = 0
        @items.each do |item|
            i+=1
            puts "#{i}. #{item.name}: Rp. #{item.price}"
        end
        puts "99. Pesan"
    end
end