class Product
  attr_accessor :remote_id, :name, :info, :price, :cost, :image, :images

  def self.to_image(image)
    url = NSURL.URLWithString(image)
    UIImage.alloc.initWithData(NSData.dataWithContentsOfURL(url))
  end
end
