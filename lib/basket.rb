class Basket

  attr_reader :items

  def initialize
    @items = []
  end

  def add(item)
    items << item
  end

  def remove(item)
    items.delete_at(items.find_index{|object| item.product_code == object.product_code})
  end

  def total
    items.inject(0){|total, item| total + item.price}
  end

  def dup
    new_basket = self.class.new
    items.each{|item| new_basket.add(item.dup)}
    new_basket
  end
end
