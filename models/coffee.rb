class Coffee
    attr_accessor :order_number,:name,:ingredients
  def initialize
    @order_number = 5
    @name = "Coffee"
    @ingredients = {"Coffee" => 3, "Sugar" => 1, "Cream" => 1}
  end
end
