class Basket

  attr_reader :items

  def initialize
    @items = []
  end

  def add(item)
    items << item
  end

  def total
    items.inject(0){|total, item| total + item.price}
  end

end
