require "basket_discount"

describe BasketDiscount do

  BASKET_DISCOUNT_THRESHOLD = 60
  DISCOUNT_PERCENTAGE = 10

  subject(:basket_discount) {described_class.new(discount_threshold: BASKET_DISCOUNT_THRESHOLD,
                                                 discount_percentage: DISCOUNT_PERCENTAGE)}

  let(:discount_basket) {double(:basket, total: BASKET_DISCOUNT_THRESHOLD + 5)}
  let(:non_discount_basket) {double(:basket, total: (BASKET_DISCOUNT_THRESHOLD - 5))}


  describe "#apply" do
    it "returns the correct total" do
      expect(basket_discount.apply(discount_basket)).to eq((BASKET_DISCOUNT_THRESHOLD + 5)*0.9)
    end
  end
end
