class ViewHistoryMenu
    def initialize(user)
        @user = user
    end
    def Run
        OrderHistoryShower.new(@user.orderHistory).Show
    end
end