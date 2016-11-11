class CaffeAmericano
  attr_accessor :ingredients
  def initialize
    @order_number = 1
    @name = "Caffe Americano"
    @ingredients = {"Espresso" => 3}
  end
end
