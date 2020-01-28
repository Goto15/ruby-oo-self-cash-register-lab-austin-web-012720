class CashRegister
    attr_accessor :discount, :last_item, :items, :total

    def initialize(discount=0)
        @discount = discount
        @total = 0
        @items = Array.new
        @last_item = {
            :item => "",
            :price => 0,
            :quantity => 0
        }
    end

    def add_item(title, price, quantity=1)
        # Change the last item hash to the last added item
        self.last_item[:item] = title
        self.last_item[:price] = price 
        self.last_item[:quantity] = quantity
    
        # Updates the total with the price times the quantity of that item
        self.total += price * quantity

        # Adds quantity of title to the end (self.items.size) of the items array
        self.items.fill(title, self.items.size, quantity)
    end

    def apply_discount
        if (self.discount != 0)
            self.total *= (1 - (self.discount / 100.0))
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_item[:quantity] * self.last_item[:price]
    end

end