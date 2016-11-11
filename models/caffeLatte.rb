class CaffeLatte
  attr_accessor :ingredients
  def initialize
    @order_number = 2
    @name = "Caffe Latte"
    @ingredients = {"Espresso" => 2, "Steamed Milk" => 1}
  end
end
