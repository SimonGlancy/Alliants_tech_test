require "item"
require_relative "helper"

describe Item do

subject(:item) {described_class.new(product_code: PRODUCT_CODE,
                                name: PRODUCT_NAME,
                                price: PRODUCT_PRICE )}

  describe "#initialize" do
    it "has a product code on creation" do
      expect(item.product_code).to eq(PRODUCT_CODE.to_sym)
    end

    it "has a product name on creation" do
      expect(item.name).to eq(PRODUCT_NAME.to_sym)
    end

    it "has a price on creation" do
      expect(item.price).to eq(PRODUCT_PRICE)
    end
  end

  describe "#discount" do
    it "reduces the price of the item" do
      item.discount(DISCOUNT_PRICE)
      expect(item.price).to eq(DISCOUNT_PRICE)
    end
  end
end
