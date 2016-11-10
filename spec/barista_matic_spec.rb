require_relative "../models/barista_matic"

describe BaristaMatic do
  let(:barista_matic) {BaristaMatic.new}

  describe "inventory stocked upon initialization" do
    it 'has an inventory variable' do
      expect(barista_matic.inventory).to exist
    end

  end
end
