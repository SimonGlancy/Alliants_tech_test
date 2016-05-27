class PromotionalRules

  def initialize(promotion)
    @multibuy_discounts = promotion[:multibuy]
    @basket_discounts = promotion[:basket]
  end

  def apply(basket)
    apply_multibuy_discount(basket)
    apply_basket_discount(basket)
  end

  private

  attr_reader :multibuy_discounts, :basket_discounts

  def apply_multibuy_discount(basket)
    multibuy_discounts.each{|multibuy_discount| multibuy_discount.apply(basket)} if multibuy_discounts
  end

  def apply_basket_discount(basket)
    basket_discounts.map{|basket_discount| basket_discount.apply(basket)}.min if basket_discounts
  end
end
