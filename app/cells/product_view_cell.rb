class ProductViewCell < UITableViewCell
  extend IB

  outlet :name, UILabel
  outlet :info, UILabel
  outlet :price, UILabel
  outlet :picture, UIImageView

  attr_accessor :product
  attr_accessor :image_index

  def setup(product)
    self.product    = product
    self.name.text  = product.name
    self.price.text  = product.cost
    self.picture.image = Product.to_image(product.image)
  end
end
