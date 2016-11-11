require_relative "../models/coffee"

class BaristaMatic
  attr_accessor :inventory, :menu
  def initialize
    @inventory = { "Cocoa" => 10, "Coffee" => 10, "Cream" => 10, "Decaf Coffee" => 10, "Espresso" => 10, "Foamed Milk" => 10, "Steamed Milk" => 10, "Sugar" => 10, "Whipped Cream" => 10 }
    @menu = [{"Caffe Americano" => "$3.30"}, {"Caffe Latte" => "$2.55"}, {"Caffe Mocha" => "$3.35"}, {"Cappucino" => "$2.90"}, {"Coffee" => "$2.75"}, {"Decaf Coffee" => "$2.75"}]
  end

  def make_drink(order_num)
    index_order = order_num - 1
    response = ""

    if index_order == 4
      order = Coffee.new
      response = "Dispensing #{self.menu[index_order].keys[0]}"
    else
      response = "Invalid selection: #{order_num}"
    end
    response
  end

  def check_inventory(drink)
    possible = false

    drink.ingredients.each do |ingredient_name, quantity|
      if self.inventory[ingredient_name] - quantity >= 0
        possible = true
      else
        possible = false
        break
      end
    end
    possible
  end

end
