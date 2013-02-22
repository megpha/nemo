class AppDelegate
  attr_accessor :order, :remote_url
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    self.order = Order.new
    self.remote_url = 'http://nimbleshop-demo-simply.herokuapp.com'

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @storyboard ||= UIStoryboard.storyboardWithName('MainStoryboard', bundle:NSBundle.mainBundle)
    @window.rootViewController = @storyboard.instantiateInitialViewController

    @window.rootViewController.wantsFullScreenLayout = true 


    @window.makeKeyAndVisible
    true 
  end 
end
