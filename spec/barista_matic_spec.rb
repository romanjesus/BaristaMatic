require_relative "../models/barista_matic"
require_relative "../models/coffee"

describe BaristaMatic do
  let(:barista_matic) {BaristaMatic.new}

  describe "inventory stocked upon initialization" do
    it 'has an inventory variable' do
      initial_inventory = { "Cocoa" => 10, "Coffee" => 10, "Cream" => 10, "Decaf Coffee" => 10, "Espresso" => 10, "Foamed Milk" => 10, "Steamed Milk" => 10, "Sugar" => 10, "Whipped Cream" => 10 }
      expect(barista_matic.inventory).to eq(initial_inventory)
    end

  describe "Menu loaded upon initialization" do
    it "has a menu variable" do
      initial_menu = [{"Caffe Americano" => "$3.30"}, {"Caffe Latte" => "$2.55"}, {"Caffe Mocha" => "$3.35"}, {"Cappucino" => "$2.90"}, {"Coffee" => "$2.75"}, {"Decaf Coffee" => "$2.75"}]

      expect(barista_matic.menu).to eq(initial_menu)
    end
  end

  describe "Can make a coffee if inventory permits" do
    it "Can create a coffee successfully" do
      expect(barista_matic.make_drink(5)).to eq("Dispensing Coffee")
    end

    it "Error is returned if an invalid selection is entered" do
      expect(barista_matic.make_drink(999)).to eq("Invalid selection: 999")
    end

  end

  end
end
