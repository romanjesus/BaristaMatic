require_relative "../models/coffee"

class BaristaMatic
  attr_accessor :inventory, :menu
  def initialize
    @inventory = {
      "Cocoa" => 10,
      "Coffee" => 10,
      "Cream" => 10,
      "Decaf Coffee" => 10,
      "Espresso" => 10,
      "Foamed Milk" => 10,
      "Steamed Milk" => 10,
      "Sugar" => 10,
      "Whipped Cream" => 10 }
    @menu = [
      {"Caffe Americano" => "$3.30"},
      {"Caffe Latte" => "$2.55"},
      {"Caffe Mocha" => "$3.35"},
      {"Cappucino" => "$2.90"},
      {"Coffee" => "$2.75"},
      {"Decaf Coffee" => "$2.75"}]
  end

  #This will find and return the drink which has it's recipe so it can be checked against the inventory. Theoretically, drink does not actually get made until inventory is used

  def drink_recipe(order_num)

    if order_num == 1
      return CaffeAmericano.new
      # response = "Dispensing #{self.menu[order_num -1].keys[0]}"
    elsif order_num == 2
      return CaffeLatte.new
    elsif order_num == 3
      return CaffeMocha.new
    elsif order_num == 4
      return Cappucino.new
    elsif order_num == 5
      return Coffee.new
    elsif order_num == 6
      return DecafCoffee.new
    else
      return response = "Invalid selection: #{order_num}"
    end
  end

  def check_inventory(drink_num)
    possible = false
    
    drink_recipe(drink_num).ingredients.each do |ingredient_name, quantity|
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
