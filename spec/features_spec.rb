require "item"
require "basket"
require "basket_discount"
require "multibuy_discount"
require "promotional_rules"
require "checkout"

describe Checkout do
  subject(:checkout) {described_class.new(promotional_rules)}

  let(:promotional_rules) {PromotionalRules.new(promotion)}

  let(:promotion) {{multibuy: [multibuy_discount],
                    basket: [basket_discount, basket_discount_2]}}

  let(:multibuy_discount) {MultibuyDiscount.new(multibuy_item: item_001,
                                                multibuy_threshold: DISCOUNT_THESHOLD,
                                                multibuy_price: DISCOUNT_PRICE)}

  let(:basket_discount) {BasketDiscount.new(discount_threshold: BASKET_DISCOUNT_THRESHOLD,
                                            discount_percentage: DISCOUNT_PERCENTAGE)}
  let(:basket_discount_2) {BasketDiscount.new(discount_threshold: 10000,
                                              discount_percentage: 20)}

  let(:item_001) {Item.new( product_code: "001", name: "Lavender heart", price: 925 )}
  let(:item_002) {Item.new( product_code: "002", name: "Personalised cufflinks", price: 4500)}
  let(:item_003) {Item.new( product_code: "003", name: "Kids T-shirt", price: 1995)}

  describe "test 001" do
    it "scan 001,002,003 -> Total price expected: £66.78" do
      checkout.scan(item_001)
      checkout.scan(item_002)
      checkout.scan(item_003)
      expect(checkout.total).to eq(6678)
    end
  end

  describe "test 002" do
    it "scan 001,003,001 -> Total price expected: £36.95" do
      checkout.scan(item_001)
      checkout.scan(item_003)
      checkout.scan(item_001)

      expect(checkout.total).to eq(3695)


    end
  end

  describe "test 003" do
    it "scan 001,002,001,003 -> Total price expected: £73.76" do
      checkout.scan(item_001)
      checkout.scan(item_002)
      checkout.scan(item_001)
      checkout.scan(item_003)

      checkout.total

      p checkout.basket.items

      expect(checkout.total).to eq(7376)
    end
  end

  describe "test 004 - engage the higher discount percentage as bill over £100" do
    it "scan 001,002,003 -> Total price expected: £95.36" do
      checkout.scan(item_001)
      checkout.scan(item_002)
      checkout.scan(item_003)
      checkout.scan(item_002)

      expect(checkout.total).to eq(9536)
    end
  end
end
