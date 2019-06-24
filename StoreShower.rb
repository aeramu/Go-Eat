class StoreShower
    def Show
        puts "Daftar Restoran:"
        i = 0
        Store.list.each do |store|
            i+=1
            puts "#{i}. #{store.name} at (#{store.position.x},#{store.position.y})"
        end
    end
end