require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items, :last_price

    def initialize employee_discount = 0
        @total = 0
        @discount = employee_discount
        @items = []
        @last_price = 0
    end

    def discount=(discount)
        @discount = discount
    end

    def total
        @total
    end

    def add_item title, price, qty = 1
        self.total += price * qty
        qty.times { @items << title }
        # binding.pry

        self.last_price = price * qty
    end

    def apply_discount
        if self.discount == 0 
            pp "There is no discount to apply."
        else
        percent_to_apply = self.discount / 100.0
        discount_amount = self.total * percent_to_apply
        self.total -= discount_amount
        pp "After the discount, the total comes to $#{Integer(self.total)}."
        end
    end

    def void_last_transaction
        # binding.pry
        self.total -= last_price
    end
end
binding.pry