require "multibuy_discount"
require_relative "helper"

describe MultibuyDiscount do

  subject(:multibuy_discount) {described_class.new(multibuy_item: item,
                                                   multibuy_threshold: DISCOUNT_THESHOLD,
                                                   multibuy_price: DISCOUNT_PRICE)}
  let(:item) {double(:item,
                      product_code: PRODUCT_CODE,
                      name: PRODUCT_NAME,
                      price: PRODUCT_PRICE,
                      discount: DISCOUNT_PRICE)}

  let(:basket) {double(:basket, items: [item,item], total: 2*PRODUCT_PRICE)}


  describe "#apply" do
    it "applies the discount to items" do
      expect(item).to receive(:discount)
      multibuy_discount.apply(basket)
    end
  end
end
