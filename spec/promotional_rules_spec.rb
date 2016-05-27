require "promotional_rules"
require_relative "helper"

describe PromotionalRules do

  subject(:promotional_rules) {described_class.new(promotion)}
  let(:promotion) {{multibuy: [multibuy_discount],
                     basket: [basket_discount]}}
  let(:only_basket_promotion) {{basket: [basket_discount]}}
  let(:only_multibuy_promotion) {{multibuy: [multibuy_discount]}}

  let(:multibuy_discount) {double(:multibuy_discount,
                                   multibuy_item: item,
                                   multibuy_threshold: DISCOUNT_THESHOLD,
                                   multibuy_price: DISCOUNT_PRICE,
                                   apply: "discount")}

   let(:basket_discount) {double(:basket_discount,
                                  discount_threshold: BASKET_DISCOUNT_THRESHOLD,
                                  discount_percentage: DISCOUNT_PERCENTAGE,
                                  apply: "discount")}
   let(:item) {double(:item,
                       product_code: PRODUCT_CODE,
                       name: PRODUCT_NAME,
                       price: PRODUCT_PRICE,
                       discount: DISCOUNT_PRICE)}

   let(:basket) {double(:basket, items: [item,item], total: 2*PRODUCT_PRICE)}


   describe "#apply" do
     it "calls the multibuy apply method" do
       expect(multibuy_discount).to receive(:apply)
       promotional_rules.apply(basket)
     end

     it "doesn't throw an error if no multibuy discount is included" do
       promotional_rules_2 = described_class.new(only_basket_promotion)
       expect{promotional_rules_2.apply(basket)}.not_to raise_error
     end

     it "calls the basket apply method" do
       expect(basket_discount).to receive(:apply)
       promotional_rules.apply(basket)
     end

     it "doesn't throw an error if no basket discount is included" do
       promotional_rules_3 = described_class.new(only_multibuy_promotion)
       expect{promotional_rules_3.apply(basket)}.not_to raise_error
     end
   end
end
