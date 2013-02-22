class Backend
  attr_reader :backend

  def loadProducts(&blk)
    @backend.getObjectsAtPath("/products",
                              parameters: nil,
                              success: blk,
                              failure: nil)
  end

  def initialize
    url = NSURL.URLWithString('http://nimbleshop-demo-simply.herokuapp.com')
    @backend = RKObjectManager.managerWithBaseURL(url)

    add_response_mapping(product_mapping, "product")
    add_response_mapping(product_mapping, "products")

    add_request_mapping(inverse_product_mapping, "product", Product)

    add_route_set(Product,
                  "/products",
                  "/products/:remote_id")
    true
  end

  private

  def debug_restkit
    RKLogInitialize()
    RKlcl_configure_by_name("RestKit/Network", RKLogLevelTrace)
    RKlcl_configure_by_name("RestKit/ObjectMapping", RKLogLevelTrace)
  end

  def product_mapping
    @product_mapping ||= begin
      mapping = RKObjectMapping.mappingForClass(Product)
      mapping.addAttributeMappingsFromDictionary(id: "remote_id",
                                                 name: "name",
                                                 info: "info",
                                                 cost: "cost",
                                                 price: "price",
                                                 images: "images",
                                                 image: "image")
    end
  end

  def inverse_product_mapping
    @inverse_proudct_mapping ||= begin
      mapping = RKObjectMapping.requestMapping
      mapping.addAttributeMappingsFromDictionary(name: "name")
      mapping.addAttributeMappingsFromDictionary(info: "info")
      mapping.addAttributeMappingsFromDictionary(image: "image")
      mapping.addAttributeMappingsFromDictionary(cost: "cost")
      mapping.addAttributeMappingsFromDictionary(price: "price")
      mapping.addAttributeMappingsFromDictionary(images: "images")
    end
  end

  def add_response_mapping(mapping, path)
    successCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)
    descriptor = RKResponseDescriptor.responseDescriptorWithMapping(mapping,
                                                               pathPattern: nil,
                                                               keyPath: path,
                                                               statusCodes: successCodes)
    backend.addResponseDescriptor(descriptor)
  end

  def add_request_mapping(mapping, path, klass)
    requestDescriptor = RKRequestDescriptor.requestDescriptorWithMapping(mapping,
                                                                         objectClass: klass,
                                                                         rootKeyPath: path)
    backend.addRequestDescriptor(requestDescriptor)
  end

  def add_route_set(klass, collection_path, resource_path)
    get_route = RKRoute.routeWithClass(klass, 
                                       pathPattern: resource_path,
                                       method: RKRequestMethodGET)
    put_route = RKRoute.routeWithClass(klass, 
                                       pathPattern: resource_path,
                                       method: RKRequestMethodPUT)
    delete_route = RKRoute.routeWithClass(klass, 
                                          pathPattern: resource_path,
                                          method: RKRequestMethodDELETE)
    post_route = RKRoute.routeWithClass(klass, 
                                        pathPattern: collection_path,
                                        method: RKRequestMethodPOST)
    backend.router.routeSet.addRoute(get_route)
    backend.router.routeSet.addRoute(put_route)
    backend.router.routeSet.addRoute(delete_route)
    backend.router.routeSet.addRoute(post_route)
  end
end
