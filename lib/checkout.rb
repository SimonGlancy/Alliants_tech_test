class Checkout

  def initialize(promotional_rules=nil, basket=Basket.new)
    @basket = basket
    @promotional_rules = promotional_rules
  end

  def scan(item)
    basket.add(item)
  end

  def remove(item)
    basket.remove(item)
  end

  def total
    promotional_rules ? promotional_rules.apply(basket.dup) : basket.total
  end

private

  attr_reader :basket, :promotional_rules

end
