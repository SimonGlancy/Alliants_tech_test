require "basket"

describe Basket do
  subject(:basket) {described_class.new}

  let(:item) {double(:item, price: 925, product_code: "item")}


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

  describe "#remove" do
    it "adds an item to the items array" do
      basket.add(item)
      basket.add(item)
      basket.remove(item)
      expect(basket.items.length).to be(1)
    end
  end

  describe "#dup" do
    it 'creates a new instance of the basket, including the items' do
      basket.add(item)
      basket.add(item)

      new_basket = basket.dup

      expect(new_basket.items).not_to be(basket.items)
    end
  end

  describe "#total" do
    it "returns the total price of the basket" do
      basket.add(item)
      basket.add(item)
      expect(basket.total).to eq(2 * 925)
    end
  end
end
