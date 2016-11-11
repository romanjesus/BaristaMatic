class CaffeMocha
  attr_accessor :order_number,:name,:ingredients
  def initialize
    @order_number = 3
    @name = "Caffe Mocha"
    @ingredients = {"Espresso" => 1, "Cocoa" => 1, "Steamed Milk" => 1, "Whipped Cream" => 1}
  end
end
