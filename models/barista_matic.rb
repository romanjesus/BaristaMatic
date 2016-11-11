Dir["./models/*.rb"].each {|file| require file }

class BaristaMatic
  attr_accessor :inventory, :menu, :ingredient_costs
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
      {1 => "Caffe Americano"},
      {2 => "Caffe Latte"},
      {3 => "Caffe Mocha"},
      {4 => "Cappucino"},
      {5 => "Coffee"},
      {6 => "Decaf Coffee"}]
    @ingredient_costs =
      {"Cocoa" => .90,
      "Coffee" => .75,
      "Cream" => .25,
      "Decaf Coffee" => .75,
      "Espresso" => 1.10,
      "Foamed Milk" => .35,
      "Steamed Milk" => .35,
      "Sugar" => .25,
      "Whipped Cream" => 1.00}
  end

  def drink_recipe(drink_num)
    if drink_num == 1
      return CaffeAmericano.new
    elsif drink_num == 2
      return CaffeLatte.new
    elsif drink_num == 3
      return CaffeMocha.new
    elsif drink_num == 4
      return Cappucino.new
    elsif drink_num == 5
      return Coffee.new
    elsif drink_num == 6
      return DecafCoffee.new
    else
      return "Invalid selection: #{drink_num}"
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

  def print_inventory
    inventory_string = "Inventory:\n"

    self.inventory.each do |ingredient, quantity|
      inventory_string += "#{ingredient}, #{quantity}\n"
    end

    inventory_string
  end

  def print_menu
    menu_string = "Menu:\n"
    drink_num = 1

    self.menu.each do |drink|
      menu_string += "#{drink_num}, #{drink.keys[0]},#{drink.values[0]}, #{check_inventory(drink_num)}\n"
      drink_num += 1
    end

    menu_string
  end

  def make_drink(drink_num)
    drink = drink_recipe(drink_num)

    drink.ingredients.each do |ingredient_name, quantity|
      self.inventory[ingredient_name] = (self.inventory[ingredient_name] - quantity)
    end

    return "Dispensing: #{drink.name}"
  end

  def restock
    self.inventory.each do |ingredient_name, quantity|
      self.inventory[ingredient_name] = 10
    end
  end

  def out_of_stock(drink_num)
      return "Out of Stock: #{drink_recipe(drink_num).name} "
    end
end
