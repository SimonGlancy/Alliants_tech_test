require "checkout"
require_relative "helper"

describe Checkout do

  subject(:checkout) {described_class.new(promotional_rules, basket)}

  let(:promotional_rules) {double(:promotional_rules,
                                   multibuy_discounts: [multibuy_discount],
                                   basket_discounts: [basket_discount],
                                   apply: BASKET_TOTAL * 0.9)}

  let(:multibuy_discount) {double(:multibuy_discount,
                                   multibuy_item: item,
                                   multibuy_threshold: DISCOUNT_THESHOLD,
                                   multibuy_price: DISCOUNT_PRICE,
                                   apply: "discount")}

  let(:basket_discount) {double(:basket_discount,
                                 discount_threshold: BASKET_DISCOUNT_THRESHOLD,
                                 discount_percentage: DISCOUNT_PERCENTAGE,
                                 apply: "discount")}

  let(:basket) {double(:basket,
                     total: BASKET_TOTAL,
                     add: "added")}

  let(:item) {double(:item,
                     product_code: PRODUCT_CODE,
                     name: PRODUCT_NAME,
                     price: PRODUCT_PRICE,
                     discount: DISCOUNT_PRICE)}


  describe "#scan" do
    it "calls the basket add method" do
      expect(basket).to receive(:add)
      checkout.scan(item)
    end
  end

  describe "#total" do
    it "calls the promotional rules apply method" do
      expect(promotional_rules).to receive(:apply).and_return(BASKET_TOTAL * 0.9)
      checkout.total
    end

    it "returns the correct total if no promotion is included" do
      checkout_2 = described_class.new(nil, basket)

      expect(checkout_2.total).to eq(BASKET_TOTAL)
    end

    it "does not throw an error if there is no promotion included" do
      checkout_2 = described_class.new(nil, basket)

      expect{checkout_2.total}.not_to raise_error
    end
  end
end
