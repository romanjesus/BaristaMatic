require_relative "../models/barista_matic"

describe BaristaMatic do
  let(:barista_matic) {BaristaMatic.new}

  describe "inventory stocked upon initialization" do
    it 'has an inventory variable' do
      initial_inventory = { "Cocoa" => 10, "Coffee" => 10, "Cream" => 10, "Decaf Coffee" => 10, "Espresso" => 10, "Foamed Milk" => 10, "Steamed Milk" => 10, "Sugar" => 10, "Whipped Cream" => 10 }
      expect(barista_matic.inventory).to eq(initial_inventory)
    end
  end

  describe "Menu loaded upon initialization" do
    it "has a menu variable" do
      initial_menu = [
        {1 => "Caffe Americano"},
        {2 => "Caffe Latte"},
        {3 => "Caffe Mocha"},
        {4 => "Cappucino"},
        {5 => "Coffee"},
        {6 => "Decaf Coffee"}]

      expect(barista_matic.menu).to eq(initial_menu)
    end
  end

  describe "Ingredient costs loaded upon initialization" do
    it "has an ingredient costs variable" do
      ingredient_costs =
        {"Cocoa" => 0.90,
        "Coffee" => 0.75,
        "Cream" => 0.25,
        "Decaf Coffee" => 0.75,
        "Espresso" => 1.10,
        "Foamed Milk" => 0.35,
        "Steamed Milk" => 0.35,
        "Sugar" => 0.25,
        "Whipped Cream" => 1.00}

      expect(barista_matic.ingredient_costs).to eq(ingredient_costs)
    end
  end

  describe "Can make a coffee if inventory permits" do
    it "Can create a coffee successfully" do
      expect(barista_matic.drink_recipe(5)).to be_instance_of(Coffee)
    end

    it "Error is returned if an invalid selection is entered" do
      expect(barista_matic.drink_recipe(999)).to eq("Invalid selection: 999")
    end

    it "Returns false if not enough ingredients" do
      barista_matic.inventory["Coffee"] = 0

      expect(barista_matic.check_inventory(5)).to eq (false)

    end

    it "Returns true if enough ingredients" do
      expect(barista_matic.check_inventory(5)).to eq (true)
    end
  end


  describe "Calculates drink costs accurately" do
    it "Returns drink cost as float" do
      expect(barista_matic.drink_cost(2)).to be_instance_of(Float)
    end
  end

  describe "print inventory method successfully prints inventory" do

    it "prints inventory as string" do
      expect(barista_matic.print_inventory).to be_instance_of(String)
    end

  end

  describe "print menu method successfully prints menu" do
    it "prints menu as a string" do
      barista_matic.print_menu
      expect(barista_matic.print_menu).to be_instance_of(String)
    end
  end

  describe "Can successfully make drinks and subtract from inventory" do
    it "Can dispense a drink order" do
      expect(barista_matic.make_drink(5)).to eq("Dispensing: Coffee")
    end
  end

  describe "Can restock inventory back to 10" do
    it "Restock method returns inventory to 10" do
      barista_matic.inventory["Coffee"] = 2
      expect(barista_matic.inventory["Coffee"]).to eq(2)
      barista_matic.restock
      expect(barista_matic.inventory["Coffee"]).to eq(10)
    end
  end

  describe "Returns out of stock plus drink name" do
    it "Returns out of stock" do
      barista_matic.inventory["Coffee"] = 0
      expect(barista_matic.out_of_stock(1)).to eq("Out of Stock: Caffe Americano")
    end
  end

end
