require_relative "./models/barista_matic"

barista_matic = BaristaMatic.new
puts "Welcome to BaristaMatic!"

puts barista_matic.print_inventory
puts barista_matic.print_menu

user_input = gets.chomp

while user_input.downcase != "q"
  drink = barista_matic.drink_recipe(user_input.to_i)
  if drink.class == String
    puts drink
    puts barista_matic.print_inventory
    puts barista_matic.print_menu
  elsif barista_matic.check_inventory(drink.order_number)
    puts barista_matic.make_drink(drink.order_number)
    puts barista_matic.print_inventory
    puts barista_matic.print_menu
  else
    puts barista_matic.out_of_stock(drink.order_number)
    puts barista_matic.print_inventory
    puts barista_matic.print_menu
  end
  user_input = gets.chomp
end
