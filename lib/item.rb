class Item

attr_reader :product_code, :name

  def initialize(product_code: nil, name: nil, price: nil)
    @product_code = product_code.to_sym
    @name = name.to_sym
    @price = price
  end

  def price
    @price
  end

  def discount(new_price)
    @price = new_price
  end
end
