class BasketDiscount

  def initialize(discount_threshold: nil, discount_percentage: nil)
    @discount_threshold = discount_threshold
    @discount_percentage = discount_percentage
  end

  def apply(basket)
    basket_discount?(basket) ? discount_total(basket) : basket.total
  end

private

  attr_reader :discount_threshold, :discount_percentage

  def basket_discount?(basket)
    basket.total > discount_threshold
  end

  def reduction
    1 - discount_percentage.to_f/100
  end

  def discount_total(basket)
    (reduction * basket.total).round
  end
end
