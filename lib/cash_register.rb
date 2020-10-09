class CashRegister
    attr_reader :discount
    attr_accessor :total, :items, :last_item_amount, :last_item_quantity 
    def initialize(employee_discount = 0)
        @total = 0  
        @discount = employee_discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        quantity.times do
            self.total += price
            self.items << title
        end
        self.last_item_amount = price * quantity
        self.last_item_quantity = quantity
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            self.total -= self.total * self.discount / 100
            "After the discount, the total comes to $#{total}."
        end
    end
    
    def void_last_transaction
        if self.items.empty?
            self.total = 0.0
        end
        self.total -= self.last_item_amount
        self.last_item_quantity.times do
            self.items.pop()
        end
    end



    
    
   
    
    
end
