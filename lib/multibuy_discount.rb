class MultibuyDiscount

  def initialize(multibuy_item: nil, multibuy_threshold: nil , multibuy_price: nil)
    @multibuy_item = multibuy_item
    @multibuy_threshold = multibuy_threshold
    @multibuy_price = multibuy_price
  end

  def apply(basket)
    find_offers_in(basket).each{|item| item.discount(multibuy_price)} if multibuy?(basket)
  end

  private

  attr_reader :multibuy_item, :multibuy_threshold, :multibuy_price

  def multibuy?(basket)
    basket.items.select{|item| item.product_code == multibuy_item.product_code}.length >= multibuy_threshold
  end

  def find_offers_in(basket)
    basket.items.select{|item| item.product_code == multibuy_item.product_code }.uniq
  end
end
