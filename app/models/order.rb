class Order
  def add(product)
    products << product
  end

  def products
    @products ||= []
  end

  def remove(product)
    products.remove(product)
  end

  def total
    products.map(&:price).map(&:to_f).reduce(:+)
  end
end
