class AppDelegate
  attr_accessor :order
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @storyboard ||= UIStoryboard.storyboardWithName('MainStoryboard', bundle:NSBundle.mainBundle)
    @window.rootViewController = @storyboard.instantiateInitialViewController

    @window.rootViewController.wantsFullScreenLayout = true 


    @window.makeKeyAndVisible
    self.order = Order.new

    true 
  end 
end
