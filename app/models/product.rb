class Product
  attr_accessor :remote_id, :name, :info, :cost, :image, :images

  def primary_image
    UIImage.alloc.initWithData(NSData.dataWithContentsOfURL(NSURL.URLWithString(image)))
  end
end
