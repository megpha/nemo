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
    #self.name.text  = product.name
    #self.info.text  = product.info
    self.price.text  = product.cost
    self.image_index = 0

    refresh_image

    self.picture.when_swiped do | o |
      next_image
      refresh_image
    end
  end

  private

  def next_image
    self.image_index = image_index + 1

    if image_index >= product.images.length 
      self.image_index = 0
    end
  end

  def refresh_image
    url = product.images[image_index]
    image = UIImage.alloc.initWithData(NSData.dataWithContentsOfURL(NSURL.URLWithString(url)))
    self.picture.image = image
  end
end
