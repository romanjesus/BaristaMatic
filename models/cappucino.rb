class Cappucino
  attr_accessor :order_number,:name,:ingredients
  def initialize
    @order_number = 4
    @name = "Caffe Mocha"
    @ingredients = {"Espresso" => 2, "Steamed Milk" => 1, "Foamed Milk" => 1}
  end
end
