require "multibuy_discount"

describe MultibuyDiscount do

  PRODUCT_CODE = "001"
  PRODUCT_NAME = "Lavender heart"
  PRODUCT_PRICE = 9.25
  DISCOUNT_PRICE = 8.50
  DISCOUNT_THESHOLD = 2

  subject(:multibuy_discount) {described_class.new(item: item,
                                                   discount_threshold: DISCOUNT_THESHOLD,
                                                   discount_price: DISCOUNT_PRICE)}
  let(:item) {double(:item,
                      product_code: PRODUCT_CODE,
                      name: PRODUCT_NAME,
                      price: PRODUCT_PRICE,
                      discount: DISCOUNT_PRICE)}

  describe "#initialize" do
    it "has an item to be discounted" do
      expect(multibuy_discount.item).to eq(item)
    end
  end
end
