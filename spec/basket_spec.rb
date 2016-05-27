require "basket"

describe Basket do
  subject(:basket) {described_class.new}

  let(:item) {double(:item, price: 9.25)}

  describe "#initialize" do
    it "has an empty items array" do
      expect(basket.items.empty?).to be(true)
    end
  end

  describe "#add" do
    it "adds an item to the items array" do
      basket.add(item)
      expect(basket.items.empty?).to be(false)
    end
  end

  describe "#total" do
    it "returns the total price of the basket" do
      basket.add(item)
      basket.add(item)
      expect(basket.total).to eq(2 * 9.25)
    end
  end
end
