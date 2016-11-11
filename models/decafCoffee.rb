class DecafCoffee
  attr_accessor :order_number,:name,:ingredients
  def initialize
    @order_number = 6
    @name = "Decaf Coffee"
    @ingredients = {"Decaf Coffee" => 3, "Sugar" => 1, "Cream" => 1}
  end
end
