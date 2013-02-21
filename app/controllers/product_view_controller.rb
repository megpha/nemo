class ProductViewController < UIViewController
  extend IB

  outlet :name, UILabel
  attr_accessor :product

  def viewDidLoad
    true
  end
end
